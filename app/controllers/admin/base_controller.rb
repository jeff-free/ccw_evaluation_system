class Admin::BaseController < ApplicationController
  before_action :is_admin, :set_evaluation
  layout "admin"
  def dashboard
    
  end

  private

  def is_admin
    redirect_to root_path if current_admin.nil?
  end

  def set_evaluation
    @evaluations = Evaluation.all
    if params[:evaluation].present?
      @evaluation = Evaluation.find(params[:evaluation])
    end
  end

  def default_url_options(options={})
    { evaluation: params[:evaluation].present? ? params[:evaluation] : nil}
  end
end
