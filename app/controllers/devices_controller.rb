class DevicesController < ApplicationController
  before_action :set_device, only: [:show, :edit, :update, :destroy]

  def show
    respond_to do |f|
      f.html
      f.json { render json: @device }
    end
  end

  def new
    @device = Device.new
  end

  def edit
    respond_to do |f|
      f.html
      f.json { render json: @device }
    end
  end

  def update
    respond_to do |format|
      if @device.update(device_params)
        format.html
        format.json { head :ok }
      else
        format.html
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
    redirect_to current_user
  end

  def create
    @device = current_user.devices.build(device_params)
    respond_to do |format|
      if @device.save
        format.html
        format.json { head :ok }
      else
        format.html
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
    redirect_to current_user
  end

  def destroy
    respond_to do |format|
      if @device.destroy
        format.html
        format.json { head :ok }
      else
        format.html
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
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
