class CreateUsers < ActiveRecord::Migration[5.2]
  def up
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :user_name
      t.integer :age 
      t.string :image
      t.string :uid
      t.integer :email 
      t.boolean :admin, :default =>  false #keep as hidden field for later
      # Dustin (2/13/2020) said remove admins altogether MVP minimal viable product. Make subjects for everyone so facebook omniauth can work
      t.string :password_digest
    end
  end

  def down 
    drop_table :users
  end
end
