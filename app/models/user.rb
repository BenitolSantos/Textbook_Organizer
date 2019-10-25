class User < ApplicationRecord
    has_many :book
    has_many :subjects, through: :textbooks
    has_many :current_pages, through: :textbooks
 
    validates :name, presence: true
 end
 
 