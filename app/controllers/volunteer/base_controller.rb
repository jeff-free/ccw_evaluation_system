class Volunteer::BaseController < ApplicationController
  before_action :set_evaluation
  before_action :authenticate_volunteer!
  
  private

  def authenticate_volunteer!
    if !current_user.volunteer?
      redirect_to root_path, notice: "你並無權限探訪此頁。"
    end
  end

  def set_evaluation
    @evaluation = Evaluation.current_active
  end
end
