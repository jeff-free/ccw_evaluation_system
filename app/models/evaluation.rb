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
  has_many :events
  belongs_to :term

  delegate :term_number, to: :term

  validates :session_number, 
            presence: true, 
            uniqueness: {scope: :term_id}, 
            numericality: {
              greater_than: 0,
              less_than_or_equal_to: 8
            }
  validates_presence_of :term


  after_save :inactive_other_evaluations

  accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true

  scope :inexistent_evaluation_on_congressman, ->(congressman){self.all - congressman.evaluations}

  scope :active_evaluation, ->{find_by(active: true)}

  def full_name
    "#{term_number}-#{session_number}"
  end

  private

    def inactive_other_evaluations
      Evaluation.where.not(id: id).update_all(active: false)
    end

end
