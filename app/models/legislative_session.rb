# == Schema Information
#
# Table name: legislative_sessions
#
#  id             :integer          not null, primary key
#  year           :integer
#  session_number :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class LegislativeSession < ActiveRecord::Base
  enum session_number: ["第一會期", "第二會期"]
  has_one :evalution
  has_many :questions, through: :evalution
  has_many :question_types, through: :questions

  validates_presence_of :year, :session_number

  after_create :create_evalution

  def full_name
    "#{year} - #{session_number}"
  end
end
