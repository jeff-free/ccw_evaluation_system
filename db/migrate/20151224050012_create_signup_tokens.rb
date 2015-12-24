class CreateSignupTokens < ActiveRecord::Migration
  def change
    create_table :signup_tokens do |t|
      t.string :token
      t.integer :token_type
      t.boolean :active, default: true

      t.timestamps null: false
    end
    add_index :signup_tokens, :token
    add_index :signup_tokens, :token_type
    add_index :signup_tokens, :active
  end
end
