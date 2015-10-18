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
    Evaluation.current_evaluation = params[:evaluation].present? ? Evaluation.find(params[:evaluation]) : nil
    @evaluation = Evaluation.current_evaluation
  end

  def default_url_options(options={})
    { evaluation: params[:evaluation].present? ? params[:evaluation] : nil}
  end
end
