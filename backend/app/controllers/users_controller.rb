class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user
  end 

  def create
    @user = User.new(user_params)
    if @user.save
      render json: {user: @user}, status: :created
    else  
      render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
    end
  end

  private 
  def set_user
		@user = User.find(params[:id])
	end

  def user_params
		params.require(:user).permit(:first_name, :last_name, :username, :email, :phone_number, :address, :password, :password_confirmation)
	end
end