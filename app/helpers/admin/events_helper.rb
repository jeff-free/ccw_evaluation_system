module Admin::EventsHelper
  def event_status(active)
    active ? "開放" : "未開放"
  end
end
