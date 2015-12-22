class Student::UsersController < Student::BaseController

  skip_before_action :authenticate_student_number!

  def edit
  end

  def update
    if current_user.update(user_params)
      if current_user.student_number.blank?
        current_user.errors.add(:student_number, "請填寫學號。")
        render :edit
      else
        redirect_to student_root_path
      end
    else
      render :edit
    end
  end

  private

  def user_params
    params[:user].permit(:student_number)
  end
end
