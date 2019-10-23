class CreateTextbooks < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.string :title
      t.string :description
      t.integer :pages
    end
  end
end
