class CreateUsers < ActiveRecord::Migration[5.2]
  def up
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :user_name
      t.integer :age 
      t.integer :email 
      t.boolean :admin, :default =>  false
      #Ex:- :default =>''
      t.string :password_digest
    end
  end

  def down 
    drop_table :users
  end
end
