class Citizen::EventsController < Citizen::BaseController

  before_action :set_event!, only: [:thanks]

  def index
    @events = Event.active
  end

  def thanks
    not_valid_inquiry_ids = current_user.inquiry_ids
    @continuable = (@event.inquiries.where.not(id: not_valid_inquiry_ids).count > 0)
  end

  private

  def set_event!
    @event = Event.find(params[:id])
  end
end