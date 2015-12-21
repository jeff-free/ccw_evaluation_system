# == Schema Information
#
# Table name: committees
#
#  id             :integer          not null, primary key
#  name           :string
#  description    :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  committee_type :integer          default(1)
#

require 'test_helper'

class CommitteeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
