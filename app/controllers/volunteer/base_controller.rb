class Volunteer::BaseController < ApplicationController
  
  private
    def set_evaluation
      @evaluation = Evaluation.current_active
    end
end
