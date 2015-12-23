class AddSomeQuestionsToSurvey < ActiveRecord::Migration
  def change
    add_column :surveys, :impression_before_and_after_watching_inquiry, :text
    add_column :surveys, :comment_to_the_congressman, :text
    add_column :surveys, :whether_to_recommend_the_inquiry, :text
    add_column :surveys, :whether_inclusion_of_unappropriate_conversion, :text
    add_column :surveys, :suggestion_of_survey, :text
  end
end
