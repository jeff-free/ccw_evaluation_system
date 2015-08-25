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

class Congressman < ActiveRecord::Base
  has_many :congressmen_evaluations
  has_many :evaluations, through: :congressmen_evaluations
  has_one :party, through: :congressmen_evaluations
  has_one :party_group, through: :congressmen_evaluations
  has_many :terms, through: :evaluations
end
