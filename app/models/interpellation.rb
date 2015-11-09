# == Schema Information
#
# Table name: interpellations
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  interpellation_date :datetime
#  content             :text(65535)
#  committee_id        :integer
#  evaluation_id       :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_interpellations_on_committee_id   (committee_id)
#  index_interpellations_on_evaluation_id  (evaluation_id)
#

class Interpellation < ActiveRecord::Base
  belongs_to :committee
  belongs_to :evaluation
  has_many :congressmen_interpellations
  has_many :congressmen, through: :congressmen_interpellations
  has_many :inquiries, through: :congressmen_interpellations
  has_many :events

  has_many :course_interpellations
  has_many :courses, through: :course_interpellations

  include Classifiable
end
