class ChangeInquiriesColumns < ActiveRecord::Migration
  def change
    remove_foreign_key :inquiries, :congressmen_interpellation
    remove_column :inquiries, :congressmen_interpellation_id, :integer, index: true
    add_column :inquiries, :congressman_id, :integer, index: true, after: :video
    add_column :inquiries, :interpellation_id, :integer, index: true, after: :congressman_id
  end
end
