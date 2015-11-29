# == Schema Information
#
# Table name: committees
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  committee_type :integer          default(1)
#  description    :text(65535)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class CommitteeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
