class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.datetime :date_to_deliver
      t.references :course

      t.timestamps null: false
    end
  end
end
