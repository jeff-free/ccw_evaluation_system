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
  has_many :committees, through: :congressmen_evaluations
  # has_one :party, through: :congressmen_evaluations
  has_many :terms, through: :evaluations
  has_many :congressmen_interpellations
  has_many :interpellations, through: :congressmen_interpellations
  has_many :inquiries
  has_many :surveys, through: :inquiries
  has_many :answers, through: :surveys

  enum sex: [:male, :female, :third_sex]

  accepts_nested_attributes_for :congressmen_evaluations
  validates_presence_of :name, :en_name, :sex

  # Should be refactored to association
  def committee_of_evaluation(evaluation)
    committees.includes(:congressmen_evaluations).where(congressmen_evaluations: {evaluation: evaluation}).references(:congressmen_evaluations).first
  end

  def has_interpellation_in_evaluation?(evaluation)
    interpellations.where(evaluation: evaluation).any?
  end
end
