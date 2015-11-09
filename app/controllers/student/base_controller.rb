class Student::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_student!

  private

  def authenticate_student!
    if !current_user.student?
      redirect_to root_path, notice: "你並無權限探訪此頁。"
    end
  end
end
