# == Schema Information
#
# Table name: terms
#
#  id          :integer          not null, primary key
#  term_number :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Term < ActiveRecord::Base
  has_many :evaluations
  validates :term_number, presence: true, uniqueness: true

  def to_param
    term_number
  end
end
