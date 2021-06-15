class UsersController < ApplicationController
  before_action :authorized, only: [:auto_login]

  # List the users
  def index
    @users = User.all
    render json: @users
  end

  # REGISTER
  def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({user_id: @user.id, email: @user.email, name: @user.name})
      render json: {user: @user, token: token}
    else
      render json: {error: "Invalid email or password"}
    end
  end

  # LOGGING IN
  def login
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id, email: @user.email, name: @user.name})
      render json: token
    else
      render json: {error: "Invalid email or password"}
    end
  end


  def auto_login
    render json: @user
  end

  private

  def user_params
    params.permit(:name, :email, :password, :age)
  end

end
