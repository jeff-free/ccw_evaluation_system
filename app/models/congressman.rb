# == Schema Information
#
# Table name: congressmen
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  en_name    :string(255)
#  sex        :integer
#  degree     :text(65535)
#  experience :text(65535)
#  fax        :string(255)
#  tel        :string(255)
#  avatar_url :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Congressman < ActiveRecord::Base
  has_many :congressmen_evaluations
  has_many :evaluations, through: :congressmen_evaluations
  has_many :parties, through: :congressmen_evaluations
  has_many :party_groups, through: :congressmen_evaluations
  has_many :committees, through: :congressmen_evaluations
  # has_one :party, through: :congressmen_evaluations
  # has_one :party_group, through: :congressmen_evaluations
  has_many :terms, through: :evaluations
  has_and_belongs_to_many :congressmen_interpellation

  enum sex: [:male, :female, :third_sex]

  accepts_nested_attributes_for :congressmen_evaluations
  validates_presence_of :name, :en_name, :sex

end
