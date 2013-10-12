
class RegistrationController < ApplicationController
  # GET /register
  def new
    redirect_to root_path if current_user

    @registration_form = RegistrationForm.new
  end

  # POST /register
  def create
    redirect_to root_path if current_user

    @registration_form = RegistrationForm.new
    if @registration_form.submit(params[:registration])
      session[:user_id] = @registration_form.user.id
      redirect_to @registration_form.user, notice: "Thank you for registering!"
    else
      render "new"
    end
  end
end
