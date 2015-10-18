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

  validates_presence_of :name
end
