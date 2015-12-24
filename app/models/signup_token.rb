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
  include Tokenable

  validates :token_type, presence: true

  enum token_type: { volunteer: 0 }

  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
  scope :recent, -> { order(id: :desc) }


  def toggle_active!
    active? ? update(active: false) : update(active: true)
  end

  def user_role
    token_type
  end
end
