# == Schema Information
#
# Table name: committees
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Committee < ActiveRecord::Base
  include Classifiable
  has_many :congressmen_evaluations
  has_many :congressmen, through: :congressmen_evaluations
  has_many :evaluations, through: :congressmen_evaluations
  has_many :interpellations

  def congressman_in_evaluation(evaluation)
    congressmen_evaluations.where(evaluation: evaluation).map(&:congressman)
  end
end
