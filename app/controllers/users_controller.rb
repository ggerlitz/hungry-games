class UsersController < ApplicationController
  def index
  end

  def new
  	@user = User.new
  end

  def edit
  end

  def show
  end

  def create
  	@user = User.new(params_user)
  	if @user.save
  		redirect_to @user, notice: "New account created."
  	else
  		render :new
  	end
  end

  def update
  end

  def destroy
  end

  private

  def params_user
  	params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :address, :bio)
  end
end
