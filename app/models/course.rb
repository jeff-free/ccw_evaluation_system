# == Schema Information
#
# Table name: courses
#
#  id            :integer          not null, primary key
#  evaluation_id :integer
#  name          :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Course < ActiveRecord::Base
  belongs_to :evaluation

  validates :name, presence: true
  validates :evaluation, presence: true

  scope :recent, -> { order(id: :desc) }
end
