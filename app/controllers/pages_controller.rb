class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dispatcher]

  def dispatcher
    case
    when current_user.citizen?
      redirect_to citizen_root_path
    else
      redirect_to pages_landing_path
    end
  end

  def landing
  end
end
