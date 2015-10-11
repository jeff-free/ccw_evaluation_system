# == Schema Information
#
# Table name: inquiries
#
#  id                            :integer          not null, primary key
#  number                        :integer
#  content                       :text(65535)
#  video                         :text(65535)
#  congressmen_interpellation_id :integer
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#

require 'test_helper'

class InquiryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
