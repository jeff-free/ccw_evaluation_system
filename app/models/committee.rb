# == Schema Information
#
# Table name: committees
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  committee_type :integer          default(1)
#  description    :text(65535)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Committee < ActiveRecord::Base
  include Classifiable
  has_many :congressmen_evaluations
  has_many :congressmen, through: :congressmen_evaluations
  has_many :evaluations, through: :congressmen_evaluations
  has_many :interpellations

  attr_accessor :api_url

  def self.import_data(api_url)
    data_array = ApiService.new(api_url).get_committee_data
    data_array.each do |committee|
      name = committee[0]
      description = committee[1]
      Committee.transaction do 
        where(name: name, description: description).first_or_create
      end
    end
  end

  def congressman_in_evaluation(evaluation)
    congressmen_evaluations.where(evaluation: evaluation).map(&:congressman)
  end
end
