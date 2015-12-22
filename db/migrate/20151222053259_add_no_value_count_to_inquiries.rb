class AddNoValueCountToInquiries < ActiveRecord::Migration
  def change
    add_column :inquiries, :no_value_count, :integer, default: 0
  end
end
