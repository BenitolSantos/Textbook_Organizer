class CreateTextbooks < ActiveRecord::Migration[5.2]
  def change
    create_table :textbooks do |t|
      t.string :title
      t.string :description
      t.integer :pages
      t.integer :cost
    end
  end
end
