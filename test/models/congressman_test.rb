# == Schema Information
#
# Table name: congressmen
#
#  id         :integer          not null, primary key
#  name       :string
#  en_name    :string
#  degree     :text
#  experience :text
#  avatar_url :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class CongressmanTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
