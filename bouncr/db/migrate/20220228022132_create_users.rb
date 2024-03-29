class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.string :firstName
      t.string :lastName
      t.integer :phoneNumber
      t.datetime :birthday

      t.timestamps
    end
  end
end
