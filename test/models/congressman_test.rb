# == Schema Information
#
# Table name: congressmen
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  en_name    :string(255)
#  sex        :integer
#  degree     :text(65535)
#  experience :string(255)
#  fax        :string(255)
#  tel        :string(255)
#  avatar_url :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class CongressmanTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
