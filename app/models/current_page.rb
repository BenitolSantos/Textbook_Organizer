class Current_Page < ApplicationRecord
   belongs_to :textbook
   belongs_to :user
   validates :name, presence: true
end

