class Current_Page < ApplicationRecord
   has_many :textbooks
   has_many :users, through: :textbooks

   validates :name, presence: true
end

