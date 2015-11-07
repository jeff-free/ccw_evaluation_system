# == Schema Information
#
# Table name: party_groups
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PartyGroup < ActiveRecord::Base
  include Classifiable
  has_many :congressmen_evaluations
  has_many :congressmen, through: :congressmen_evaluations
  has_many :evaluations, through: :congressmen_evaluations
  
  validates_presence_of :name
end
