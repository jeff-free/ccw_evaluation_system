# == Schema Information
#
# Table name: courses
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  token      :string(255)
#

class Course < ActiveRecord::Base
  has_many :course_interpellations
  has_many :interpellations, through: :course_interpellations

  has_many :inquiries, through: :interpellations


  has_many :students, class_name: "User"

  validates :name, presence: true

  scope :recent, -> { order(id: :desc) }
end
