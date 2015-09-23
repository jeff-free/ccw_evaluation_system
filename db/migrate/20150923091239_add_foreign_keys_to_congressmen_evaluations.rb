class AddForeignKeysToCongressmenEvaluations < ActiveRecord::Migration
  def change
    add_foreign_key :congressmen_evaluations, :congressmen
    add_foreign_key :congressmen_evaluations, :evaluations
    add_foreign_key :congressmen_evaluations, :parties
    add_foreign_key :congressmen_evaluations, :party_groups
  end
end
