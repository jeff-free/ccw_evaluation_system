class RemoveQuestionTypeDescription < ActiveRecord::Migration
  def change
    remove_column :question_types, :description, :string
  end
end
