class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.string :name
      t.integer :user_id
      t.integer :book_id
    end
  end
end
