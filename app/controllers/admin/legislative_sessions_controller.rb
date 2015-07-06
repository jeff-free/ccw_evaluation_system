class Admin::LegislativeSessionsController < Admin::BaseController
  def index
  end

  def show
  end

  def new
    @legislative_session = LegislativeSession.new
  end

  def create
    @legislative_session = LegislativeSession.new(legislative_session_params)
    if @legislative_session.save
      redirect_to admin_dashboard_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def legislative_session_params
    params[:legislative_session].permit!
  end
end
