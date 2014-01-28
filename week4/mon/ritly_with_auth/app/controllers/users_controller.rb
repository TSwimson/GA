class UsersController < ApplicationController
   def show
    @user = User.find(params[:id])
    redirect_to root_url
  end

  def new
    @user = User.new()
  end

  def create
    @user=User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation))
    if @user.save
      flash[:success] = "Welcome Ritly!"
      sign_in @user
      redirect_to '/'
    else
      render 'new'
    end
  end

 # def update
 #    @user = User.find(params[:id])
 #    @user.update_attributes(params[:user])
 #    render :show
 #  end
end
