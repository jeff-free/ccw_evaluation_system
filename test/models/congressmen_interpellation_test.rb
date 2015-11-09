# == Schema Information
#
# Table name: congressmen_interpellations
#
#  id                :integer          not null, primary key
#  congressman_id    :integer
#  interpellation_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_congressmen_interpellations_on_congressman_id     (congressman_id)
#  index_congressmen_interpellations_on_interpellation_id  (interpellation_id)
#

require 'test_helper'

class CongressmenInterpellationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
