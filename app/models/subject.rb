class Subject < ApplicationRecord
    belongs_to :textbook
    belongs_to :user
    validates :name, presence: true

    def add_textbook
      @user = self.user
      @textbook = self.textbook  
    end
 end
 
 