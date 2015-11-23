# == Schema Information
#
# Table name: terms
#
#  id          :integer          not null, primary key
#  term_number :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Term < ActiveRecord::Base
  has_many :evaluations
  has_many :congressmen, through: :evaluations
  validates :term_number, presence: true, uniqueness: true

  default_scope {order(term_number: :desc)}
end
