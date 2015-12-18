class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dispatcher]

  def dispatcher
    case
    when current_user.citizen?
      redirect_to citizen_root_path
    when current_user.volunteer?
      redirect_to volunteer_root_path
    when current_user.student?
      redirect_to student_root_path
    when current_user.teacher?
      redirect_to teachers_root_path
    else
      redirect_to pages_landing_path
    end
  end
end
