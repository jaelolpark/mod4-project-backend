class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy, :update]

  def index
    @users = User.all
    render json: @users, each_serializer: UserSerializer
  end

  def show
    render json: @user, each_serializer: UserSerializer
  end 

  def create
    @user = User.new(user_params)
    if @user.save
      render json: { user: @user }, status: :created
    else  
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    unless @user.nil?
      @user.destroy
      render json: { user: @user }
    else
      render json: { error: "User not Found!" }, status: 404
    end
  end

  def update
    if @user.update(user_params)
      render json: { user: @user }, status: :updated
    else  
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
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