class CreateCurrentPages < ActiveRecord::Migration[5.2]
    def change
      create_table :current_pages do |t|
        t.integer :page_num
        t.integer :chapter_num
        t.integer :user_id
        t.integer :textbook_id
      end
    end
  end