class Admin::UsersController < Admin::BaseController
  before_action :set_user!, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_users_path(@user), notice: "使用者新增成功"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: "使用者更新成功"
    else
      render :edit
    end
  end

  private

  def set_user!
    @user = User.find(params[:id])
  end

  def user_params
    params[:user].permit(:email, :password, :password_confirmation, :name, :identity, :role, :district_id, :birthdate)
  end
end
