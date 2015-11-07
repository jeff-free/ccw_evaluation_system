class Citizen::EventsController < Citizen::BaseController
  def index
    @events = Event.all
  end
end