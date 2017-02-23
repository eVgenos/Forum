class RegistrationsController < Devise::RegistrationsController

  def destroy
    User.update(current_user.id, deleted: true)
    redirect_to root_path, notice: 'Your account has been deleted'
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password, :avatar)
  end
end