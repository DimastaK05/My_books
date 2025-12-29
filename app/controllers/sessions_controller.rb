class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to books_path, notice: "Добро пожаловать, #{user.name}!"
    else
      flash.now[:alert] = "Неверный email или пароль"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Вы вышли из системы"
  end
end