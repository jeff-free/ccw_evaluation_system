# == Schema Information
#
# Table name: events
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  evaluation_id     :integer
#  interpellation_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  active            :boolean          default(FALSE)
#

class Event < ActiveRecord::Base
  include Classifiable
  belongs_to :evaluation
  belongs_to :interpellation
  has_many :inquiries, through: :interpellation

  has_many :users_events, dependent: :destroy 
  has_many :users, through: :users_event

  validates_presence_of :interpellation_id

  scope :active, -> { where(active: true) }

end
