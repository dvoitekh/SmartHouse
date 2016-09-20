class DevicesController < ApplicationController
  before_action :set_device, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @device = Device.new
  end

  def edit
  end

  def update
    @device.update_attributes(device_params)
    redirect_to current_user
  end

  def create
    @device = current_user.devices.build(device_params)
    @device.save
    redirect_to current_user
  end

  def destroy
    @device.destroy
    redirect_to current_user
  end

  private

  def set_device
    @device = Device.find(params[:id])
  end

  def device_params
    params.require(:device).permit(:user_id, :bt_mac_address, :category_id, :name, :power, :validity, :active)
  end
end
