class DropPartyGroups < ActiveRecord::Migration
  def up
    remove_foreign_key(:congressmen_evaluations, :party_group)
    remove_column :congressmen_evaluations, :party_group_id
    drop_table :party_groups
  end

  def down
    create_table :party_groups do |t|
      t.string :name

      t.timestamps null: false
    end
    add_column :congressmen_evaluations, :party_group_id, :integer, index: true
  end
end
