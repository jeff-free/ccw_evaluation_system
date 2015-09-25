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

require 'test_helper'

class CongressmenInterpellationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
