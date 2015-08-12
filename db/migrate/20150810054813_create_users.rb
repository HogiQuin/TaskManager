class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_number
      t.string :first_name
      t.string :last_name
      t.string :password_digest
      t.string :email
      t.string :phone
      t.string :role
      t.integer :age

      t.timestamps null: false
    end
  end
end
