class TransfersController < ApplicationController
  before_action :authenticate_user
  
  def new
    @bike = Bike.where(user: current_user).find(bike_id)
    @transfer_form = TransferForm.new(@bike)
  end

  def create
    @bike = Bike.where(user: current_user).find(bike_id)
    @transfer_form = TransferForm.new(@bike)
  
    if @transfer_form.submit(transfer_params)
      redirect_to bikes_path, notice: "Bike has been successfully transferred!"
    else
      render :new
    end
  end

  def bike_id
    params.permit(:id)[:id]
  end

  def transfer_params
    params.require(:transfer)
    params[:transfer].permit(:email, :first_name, :last_name)
  end
end
