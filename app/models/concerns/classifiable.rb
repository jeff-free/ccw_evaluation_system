module Classifiable
  extend ActiveSupport::Concern

  included do
    # 讓透過 congressmen_evaluations 的 model 建立 association
    unless attribute_method?(:evaluation=)
      has_many :congressmen_evaluations
      has_many :congressmen, through: :congressmen_evaluations
      has_many :evaluations, through: :congressmen_evaluations
    end

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