# == Schema Information
#
# Table name: evaluations
#
#  id             :integer          not null, primary key
#  term_id        :integer
#  session_number :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Evaluation < ActiveRecord::Base
  has_many :questions, dependent: :destroy
  has_many :question_types, through: :questions
  has_many :congressmen_evaluations
  has_many :congressmen, through: :congressmen_evaluations
  has_many :parties, through: :congressmen_evaluations
  belongs_to :term
  enum session_number: ["1", "2"]

  delegate :term_number, to: :term

  validates_presence_of :session_number
  accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true

  scope :inexistent_evaluation_on_congressman, ->(congressman){self.all - congressman.evaluations}

  def full_name
    "第 #{term_number} - #{session_number} 會期"
  end
end
