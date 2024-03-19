class FamiliesController < ApplicationController
  before_action :family_info, except: [:new, :create]

  def top
  end

  def new
    @family = current_user.families.build
  end

  def create
    @family = Family.new(family_params)
    @family.users << current_user
    if @family.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @members = @family.users
  end

  def edit
  end

  def update
    if @family.update(family_params)
      redirect_to edit_family_path(params[:id]), success: 'ファミリー名を変更しました'
    else
      flash.now[:danger] = '変更できませんでした'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    family = Family.find(params[:id])
    if family.destroy
      redirect_to root_path
    else
      flash.now[:danger] = '削除できませんでした'
      render :show
    end
  end

  def withdraw
    family_user = FamilyUser.find_by(family_id: params[:id], user_id: current_user.id)
    if family_user.destroy
      redirect_to root_path
    else
      redirect_to root_path, danger: '退会できませんでした'
    end
  end

  private

  def family_info
    @family = Family.find(params[:id])
  end

  def family_params
    params.require(:family).permit(:name)
  end
end
