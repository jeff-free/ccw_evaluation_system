class CreateCongressmen < ActiveRecord::Migration
  def change
    create_table :congressmen do |t|
      t.string :name
      t.string :en_name
      t.integer :sex
      t.text :degree
      t.text :experience
      t.string :fax
      t.string :tel
      t.string :avatar_url

      t.timestamps null: false
    end
  end
end
