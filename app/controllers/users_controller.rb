class UsersController < ApplicationController
  # Создание нового пользователя
  def new
    @user = User.new
  end

  # Получение информации по существующему пользователю.
  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

end
