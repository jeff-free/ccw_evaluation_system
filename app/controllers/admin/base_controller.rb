class Admin::BaseController < ApplicationController
  before_action :is_admin, :set_evaluation
  layout "admin"
  def dashboard
    @inquiry = Inquiry.new
  end

  def upload_inquiries
    Inquiry.import_data(inquiry_params[:file].path)
    redirect_to admin_root_path
  end

  private

    def is_admin
      redirect_to root_path if current_admin.nil?
    end

    def set_evaluation
      @evaluations = Evaluation.all
      Evaluation.current_evaluation = params[:current_evaluation_id].present? ? Evaluation.find(params[:current_evaluation_id]) : nil
      @evaluation = Evaluation.current_evaluation
    end

    def default_url_options(options={})
      { current_evaluation_id: params[:current_evaluation_id].present? ? params[:current_evaluation_id] : nil}
    end

    def inquiry_params
      params[:inquiry].permit(:file)
    end
end
