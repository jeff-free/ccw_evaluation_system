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

require 'test_helper'

class InterpellationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
