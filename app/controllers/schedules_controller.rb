class SchedulesController < ApplicationController
  before_action :schedule_new, only: [:index, :new, :create]
  before_action :schedule_update, only: [:show, :edit, :update, :destroy]

  def index
    @schedules = @family.schedules 
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to new_family_schedule_path(@family.id), success: "登録しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @schedule.update(schedule_params)
      redirect_to schedule_path(@schedule.id), success: "変更しました"
    else
      flash.now[:danger] = "変更できませんでした"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @schedule.destroy
      redirect_to family_schedules_path(@family.id)
    else
      flash.now[:danger] = "削除できませんでした"
      render :show
    end
  end

  private

  def schedule_new
    @family = Family.find(params[:family_id])
    unless current_user.families.include?(@family)
      redirect_to root_path, danger: "あなたは、このファミリーに所属していないため、アクセスできません。"
    end
  end

  def schedule_update
    @schedule = Schedule.find(params[:id])
    @family = @schedule.family
    unless current_user.families.include?(@family)
      redirect_to root_path, danger: "あなたは、このファミリーに所属していないため、アクセスできません。"
    end
  end

  def schedule_params
    params.require(:schedule).permit(:event, :start_time, :end_time, :user_id).merge(family_id: @family.id)
  end

end
