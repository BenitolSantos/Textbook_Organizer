class Subject < ApplicationRecord
    has_many :textbooks
    has_many :user_subjects
    has_many :users, through: :user_subjects
    validates :name, presence: true

    def add_textbook
      @user = self.user
      @textbook = self.textbook  
    end
 end
 
 