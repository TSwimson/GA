class UsersController < ApplicationController
  def new
  end

  def show
    @user = User.new
    @user.name = "Markus"
    @user.email = "abc@ddd.com"
  end

  def create
  end
end
