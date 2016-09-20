class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    respond_to do |f|
      f.html
      f.json { render json: @user.to_json(include: :devices) }
    end
  end

  def edit
    respond_to do |f|
      f.html
      f.json { render json: @user.to_json(include: :devices) }
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_user
    @user = current_user || User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:role, :name, :email, :password, :password_confirmation)
  end
end
