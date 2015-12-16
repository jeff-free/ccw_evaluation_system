class Teachers::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_teacher!

  private

  def authenticate_teacher!
    if !current_user.teacher?
      redirect_to root_path, notice: "你並無權限探訪此頁。"
    end
  end
end
