class Citizen::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_citizen!

  private

  def authenticate_citizen!
    if !current_user.citizen?
      redirect_to root_path, notice: "你並無權限探訪此頁。"
    end
  end
end
