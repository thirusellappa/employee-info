class UsersController < ApplicationController
  
  def index
    @users = User.order(id: :desc).paginate(:page => params[:page], :per_page => 15)
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      @user.calculate_pay
      redirect_to @user
    else
      p @user.errors
      render "new"
    end
  end
  
  def show
    @user = User.find_by(params[:id])
  end
  
  def edit
    @user = User.find_by(params[:id])
  end
  
  def update
    @user = User.find_by(params[:id])
    if @user.update(user_params)
      @user.calculate_pay
      redirect_to @user
    else
      render "edit"
    end
  end
  
  def destroy
    @user = User.find_by(params[:id])
    @user.destroy
    respond_to do |format|
      format.html {redirect_to root_path}
      format.js
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :age, :basic_pay, :pf_deduction, :gender)
  end
  
end
