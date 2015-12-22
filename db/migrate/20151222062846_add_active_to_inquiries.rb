class AddActiveToInquiries < ActiveRecord::Migration
  def change
    add_column :inquiries, :active, :boolean, default: true
  end
end
