class SchedulesController < ApplicationController
  def index
    @family = Family.find(params[:family_id])
    @schedules = @family.schedules 
  end

  def new
    @family = Family.find(params[:family_id])
    @schedule = Schedule.new
  end

  def create
    @family = Family.find(params[:family_id])
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to new_family_schedule_path(@family.id), success: "登録しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
    @family = @schedule.family
  end

  def edit
    @schedule = Schedule.find(params[:id])
    @family = @schedule.family
  end

  def update
    @schedule = Schedule.find(params[:id])
    @family = @schedule.family
    if @schedule.update(schedule_params)
      redirect_to schedule_path(@schedule.id), success: "変更しました"
    else
      flash.now[:danger] = "変更できませんでした"
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:event, :start_time, :end_time, :user_id).merge(family_id: @family.id)
  end
  
end
