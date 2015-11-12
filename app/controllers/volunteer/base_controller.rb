class Volunteer::BaseController < ApplicationController
  before_action :set_evaluation
  
  private
    def set_evaluation
      @evaluation = Evaluation.current_active
    end
end
