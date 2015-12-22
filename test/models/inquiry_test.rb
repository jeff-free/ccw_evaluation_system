# == Schema Information
#
# Table name: inquiries
#
#  id                :integer          not null, primary key
#  number            :integer
#  content           :text
#  video             :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  congressman_id    :integer
#  interpellation_id :integer
#  no_value_count    :integer          default(0)
#

require 'test_helper'

class InquiryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
