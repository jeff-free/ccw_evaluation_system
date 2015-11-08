class Course < ActiveRecord::Base
  belongs_to :evaluation

  validates :name, presence: true
  validates :evaluation, presence: true
end
