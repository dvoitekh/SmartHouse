class DevicesController < ApplicationController
  before_action :set_device, only: [:show, :edit, :update, :destroy]

  def index
    @devices = Device.all
  end

  def show
    @device = Device.find(params[:id])
  end

  def new
    @device = Device.new
  end

  def edit
    @user = User.find(params[:user_id])
    @device = Device.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @device = Device.find(params[:id])
    @device.update_attributes(device_params)
    redirect_to @user
  end

  def create
    @user = User.find(params[:user_id])
    @device = @user.devices.build(device_params)
    @device.user_id = current_user.id
    @device.save
    redirect_to @user
  end

  def destroy
    @user = User.find params[:user_id]
    @device = @user.devices.find params[:id]
    @device.destroy
    redirect_to @user
  end

  private

  def set_device
    @device = Device.find(params[:id])
  end

  def device_params
    params.require(:device).permit(:user_id, :bt_mac_address, :category_id, :name, :power, :validity, :active)
  end
end
