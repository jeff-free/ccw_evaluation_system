class Admin::BaseController < ApplicationController
  before_action :is_admin
  layout "admin"
  def dashboard
    
  end

  private

  def is_admin
    redirect_to root_path if current_admin.nil?
  end
end
