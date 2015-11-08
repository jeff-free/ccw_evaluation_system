module Admin::BaseHelper
  def current_evaluation_full_name
    if params[:current_evaluation_id].present?
      "目前會期:#{@evaluation.full_name}"
    else
      "所有會期"
    end
  end
end
