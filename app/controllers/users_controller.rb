class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def sign_up
    @token = User.find_by(token_id: params[:token_id])
    if User.where(token_id: @token.token_id).any?
      @token.update_attribute(:active, true)
      redirect_to set_up_password_users_path, :notice => "Your Verified."
    else
      render 'new'
    end
  end

  def create
    @user = User.new(user_params)

    if  @user.save
    UserNotifierMailer.send_signup_email(@user).deliver
    redirect_to users_path, :notice => "Post has been saved successfully."
    else
    render 'new'
    end
  end

  def index
    @users = User.all
  end

  def show
  end

  def set_up_password
    binding.pry
    if (params[:password])
      @user = User.new(user_params)
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :city, :password)
    end
end

