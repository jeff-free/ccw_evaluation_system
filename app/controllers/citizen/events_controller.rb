class Citizen::EventsController < Citizen::BaseController
  def index
    # TODO: change condition
    @events = Event.all
  end
end