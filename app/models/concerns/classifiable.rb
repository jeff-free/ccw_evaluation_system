module Classifiable
  extend ActiveSupport::Concern

  included do

    scope :in_current_evaluation, ->{
      if Evaluation.current_evaluation.present?
        # 讓 interpellation 等與 congressmen_evaluation 無關的 model 使用 
        if attribute_method?(:evaluation=)
          where(evaluation: Evaluation.current_evaluation)
        else
          includes(:congressmen_evaluations).where(congressmen_evaluations: {evaluation: Evaluation.current_evaluation})
        end
      else
        all
      end
    }
  end
end