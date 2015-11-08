class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dispatch]

  def dispatcher
    case
    when current_user.citizen?
      redirect_to citizen_root_path
    else
      redirect_to root_path
    end
  end

  def landing
  end
end
