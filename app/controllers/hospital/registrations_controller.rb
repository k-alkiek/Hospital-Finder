class Hospital::RegistrationsController < Devise::RegistrationsController
  before_action :reset_session
  private

  def sign_up_params
    params.require(:hospital).permit(:name, :email, :password, :password_confirmation, :phone_number, :address, :description)
  end

  def account_update_params
    params.require(:hospital).permit(:name, :email, :password, :password_confirmation, :phone_number, :address, :description, :current_password)
  end
end