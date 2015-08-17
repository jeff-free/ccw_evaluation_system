# == Schema Information
#
# Table name: evaluations
#
#  id                     :integer          not null, primary key
#  legislative_session_id :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class Evaluation < ActiveRecord::Base
  has_and_belongs_to_many :questions
  has_many :question_types, through: :questions
  enum session_number: ["第一會期", "第二會期"]

  validates_presence_of :year, :session_number

  def full_name
    "#{year} - #{session_number}"
  end
end
