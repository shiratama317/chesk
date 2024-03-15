class Users::InvitationsController < Devise::InvitationsController
  def create
    @user = User.new
    @family_user = FamilyUser.new
    user_email = params[:user][:email]
    user_nickname = params[:user][:nickname]
    family_id = params[:user][:family_id]
    if User.find_by(email: user_email.downcase).present? # 既存ユーザーの処理
      user_id = User.where(email: user_email).pluck(:id)
      if FamilyUser.find_by(user_id: user_id[0], family_id: family_id).present?
        flash.now[:danger] = 'すでに所属しています（同じユーザーは招待できません）'
        render :new, status: :unprocessable_entity
      else
        @family_user.user_id = user_id[0]
        @family_user.family_id = family_id
        @family_user.save
        redirect_to new_user_invitation_path, success: 'ファミリーに招待しました'
      end
    elsif user_nickname.present?
      new_user = User.invite!(email: user_email, nickname: user_nickname) # 新規ユーザーの処理
      @family_user.user_id = new_user.id
      @family_user.family_id = family_id
      @family_user.save
      redirect_to new_user_invitation_path, success: "招待メールが#{user_email}に送信されました。"
    else
      flash.now[:danger] = '招待に失敗しました'
      return render :new, status: :unprocessable_entity
    end
  end
end
