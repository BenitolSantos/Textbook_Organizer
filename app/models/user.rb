class User < ApplicationRecord
    has_many :textbooks
    has_many :subjects, through: :textbooks
    has_many :current_pages
    has_many :current_pages, through: :textbooks
    has_secure_password #always remember this. and bcrypt. It make the passwords secure
    validates :user_name, presence: true
 end
 
 