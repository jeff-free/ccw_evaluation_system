# == Schema Information
#
# Table name: signup_tokens
#
#  id         :integer          not null, primary key
#  token      :string
#  token_type :integer
#  active     :boolean          default(TRUE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SignupToken < ActiveRecord::Base
  validates :token_type, presence: true

  enum token_type: { volunteer: 0 }


  def deactivate!
    update(active: false)
  end
end
