class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
  end

  def new
    @user = User.new
  end

  def show
    if params[:id] =~ /^\d+$/
      @user = User.find(params[:id])
      @events = @user.created_events
    else
      redirect_to root_path, alert: "Invalid user ID"
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.save(user_params)
      redirect_to @user, notice: "Profile updated successfully."
    else
      render :edit, alert: "There was an error updating your profile."
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
