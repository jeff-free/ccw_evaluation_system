# == Schema Information
#
# Table name: terms
#
#  id          :integer          not null, primary key
#  term_number :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_terms_on_term_number  (term_number)
#

require 'test_helper'

class TermTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
