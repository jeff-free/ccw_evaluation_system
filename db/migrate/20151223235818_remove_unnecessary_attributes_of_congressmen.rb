class RemoveUnnecessaryAttributesOfCongressmen < ActiveRecord::Migration
  def change
    remove_column :congressmen, :sex, :integer
    remove_column :congressmen, :fax, :string
    remove_column :congressmen, :tel, :string
  end
end
