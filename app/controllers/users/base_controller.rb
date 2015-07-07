class Users::BaseController < ApplicationController
  before_action :is_user

  private

  def is_user
    redirect_to root_path if current_user.nil?
  end
end
