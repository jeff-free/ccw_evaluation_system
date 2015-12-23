# == Schema Information
#
# Table name: congressmen
#
#  id         :integer          not null, primary key
#  name       :string
#  en_name    :string
#  sex        :integer
#  degree     :text
#  experience :text
#  fax        :string
#  tel        :string
#  avatar_url :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Congressman < ActiveRecord::Base
  has_many :congressmen_evaluations
  has_many :evaluations, through: :congressmen_evaluations
  has_many :parties, through: :congressmen_evaluations
  has_many :committees, through: :congressmen_evaluations
  has_many :terms, through: :evaluations
  has_many :congressmen_interpellations
  has_many :interpellations, through: :congressmen_interpellations
  has_many :inquiries
  has_many :surveys, through: :inquiries
  has_many :answers, through: :surveys

  enum sex: ["male", "female", "third_sex"]

  attr_accessor :api_url

  accepts_nested_attributes_for :congressmen_evaluations
  validates_presence_of :name, :en_name, :sex

  # Should be refactored to association
  def committee_of_evaluation(evaluation)
    committees.includes(:congressmen_evaluations).where(congressmen_evaluations: {evaluation: evaluation}).references(:congressmen_evaluations).first
  end

  def self.import_data(url)
    congressmen_list = ApiService.new(url).get_congressman_data
    congressmen_list.each do |congressman_data|
      congressman = Congressman.where(name: congressman_data["name"]).first_or_create
      congressman.update(en_name: congressman_data["ename"], sex: congressman_data["sex"],
        tel: congressman_data["tel"],
        fax: congressman_data["fax"],
        experience: congressman_data["experience"],
        avatar_url: congressman_data["picUrl"],
        degree: congressman_data["degree"])
      party = Party.where(name: congressman_data["party"]).first_or_create
      congressman_current_file = congressman.congressmen_evaluations.where(evaluation: Evaluation.current_active).first_or_create
      congressman_current_file.update(party: party)
    end
    import_congressmen_committee_data(url)
  end

  def self.import_congressmen_committee_data(url)
    congressmen_list = ApiService.new(url).get_congressman_data
    congressmen_list.each do |congressman_data|
      congressman = Congressman.find_by(name: congressman_data["name"])
      congressman_committees = congressman_data["committee"].gsub("：", ":").split(";")
      congressman_committees_array = []
      congressman_committees.each{|c| congressman_committees_array << c.split(":")}
      congressman_committees_array.delete_if{|committee| Committee.find_by(name: committee[1]).not_regular?}
      # committee_hash = Hash[*(committee.split(":"))].delete_if{|key, value| Committee.find_by(name: value).not_regular?}
      current_congressman_committee_data = congressman_committees_array.last
      congressman.congressmen_evaluations.find_by(evaluation: Evaluation.current_active).update(committee: Committee.find_by(name: current_congressman_committee_data[1]))
    end
  end

  def has_interpellation_in_evaluation?(evaluation)
    interpellations.where(evaluation: evaluation).any?
  end
end
