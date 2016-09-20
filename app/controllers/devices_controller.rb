class DevicesController < ApplicationController
  before_action :set_device, only: [:show, :edit, :update, :destroy]

  def new
    @device = Device.new
  end

  def create
    @device = current_user.devices.build(device_params)
    respond_to do |format|
      if @device.save
        format.html { redirect_to current_user }
        format.json { head :ok }
      else
        format.html { redirect_to current_user }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    respond_to do |f|
      f.html
      f.json { render json: @device }
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @device.update(device_params)
        format.html { redirect_to current_user }
        format.json { head :ok }
      else
        format.html { redirect_to current_user }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @device.destroy
    respond_to do |format|
      format.html { redirect_to current_user }
      format.json { head :ok }
    end
  end

  private

  def set_device
    @device = Device.find(params[:id])
  end

  def device_params
    params.require(:device).permit(:user_id, :bt_mac_address, :category_id, :name, :power, :validity, :active)
  end
end
