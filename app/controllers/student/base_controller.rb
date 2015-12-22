class Student::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_student!
  before_action :authenticate_student_number!

  private

  def authenticate_student!
    if !current_user.student?
      redirect_to root_path, notice: "你並無權限探訪此頁。"
    end
  end

  def authenticate_student_number!
    if current_user.student_number.blank?
      redirect_to edit_student_user_path(current_user), notice: "請填寫學號。"
    end
  end
end
