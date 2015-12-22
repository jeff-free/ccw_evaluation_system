# == Schema Information
#
# Table name: inquiries
#
#  id                :integer          not null, primary key
#  number            :integer
#  content           :text
#  video             :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  congressman_id    :integer
#  interpellation_id :integer
#  no_value_count    :integer          default(0)
#

class Inquiry < ActiveRecord::Base
  belongs_to :congressman
  belongs_to :interpellation
  has_many :surveys
  has_many :answers, through: :surveys
  delegate :evaluation, to: :interpellation
  delegate :interpellation_date, to: :interpellation

  attr_accessor :file

  # TODO: don't use scope if this is not chainable.
  scope :in_current_evaluation, ->(evaluation){evaluation.interpellations.map(&:inquiries).flatten}

  def name
    "#{number} - #{content}"
  end

  def self.import_data(file)
    records = FileService.new(file).parse_csv
    irregular_committee_of_current_evaluation = Committee.in_current_evaluation.not_regular.map{|committee| committee.name}
    records.delete_if{|record| record[1] == "院會" || irregular_committee_of_current_evaluation.include?(record[1])}
    # if self.count > 0
    #   last_update_date = self.last.interpellation_date
    #   records.delete_if{|record|
    #     record[0].to_date < last_update_date
    #   }
    # end
    records.each do |record|
      committee = Committee.find_by(name: record[1])
      interpellation = Interpellation.where(name: record[2], interpellation_date: record[0], committee: committee, evaluation: Evaluation.current_active).first_or_create
      congressman = Congressman.find_by(name: record[4])
      Inquiry.where(interpellation: interpellation, congressman: congressman, content: record[3], video: record[5]).first_or_create
    end
  end
end
