class Admin::LegislativeSessionsController < Admin::BaseController
  before_action :set_legislative_session, only: [:show, :edit, :update, :destroy]
  def index
    @legislative_sessions = LegislativeSession.all
  end

  def show
  end

  def new
    @legislative_session = LegislativeSession.new
  end

  def create
    @legislative_session = LegislativeSession.new(legislative_session_params)
    if @legislative_session.save
      redirect_to admin_legislative_session_path(@legislative_session)
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

  def set_legislative_session
    @legislative_session = LegislativeSession.find(params[:id])
  end

  def legislative_session_params
    params[:legislative_session].permit!
  end
end
