class AddReferenceInquiryToSurvey < ActiveRecord::Migration
  def change
    add_reference :surveys, :inquiry, before: :created_at, index: true
  end
end
