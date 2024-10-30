class UsersController < ApplicationController
  before_action :set_user, only: [:show, :index, :edit, :update]

  def show
  end

  def index
    redirect_to user_path(@user.id)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "User was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :username,
      :avatar
    )
  end

  def set_user
    @user = User.find(current_user.id)
  end
end
