class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.references :semester
      t.timestamps null: false
    end
  end
end
