# == Schema Information
#
# Table name: evaluations
#
#  id             :integer          not null, primary key
#  term_id        :integer
#  session_number :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  active         :boolean          default(FALSE)
#

class Evaluation < ActiveRecord::Base
  class_attribute :current_evaluation

  has_many :questions, dependent: :destroy
  has_many :question_types, through: :questions
  has_many :congressmen_evaluations
  has_many :congressmen, through: :congressmen_evaluations
  has_many :parties, through: :congressmen_evaluations
  has_many :interpellations
  belongs_to :term
  enum session_number: ["1", "2"]

  delegate :term_number, to: :term

  validates_presence_of :session_number
  validates_uniqueness_of :session_number, scope: :term_id

  after_save :inactive_other_evaluations

  accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true

  scope :inexistent_evaluation_on_congressman, ->(congressman){self.all - congressman.evaluations}

  def full_name
    "#{term_number}-#{session_number}"
  end

  private

    def inactive_other_evaluations
      Evaluation.where.not(id: id).update_all(active: false)
    end

end
