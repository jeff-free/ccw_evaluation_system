class Volunteer::CongressmenController < Volunteer::BaseController
  before_action :set_evaluation
  
  def index
    @parties = @evaluation.parties.includes(:congressmen)
  end

  def show
    @congressman = Congressman.find(params[:id])
    @inquiries = @congressman.inquiries
  end

end
