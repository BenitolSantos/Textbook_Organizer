class User < ApplicationRecord
    has_many :book
    has_many :subjects, through: :textbooks
    has_many :current_pages, through: :textbooks
    has_secure_password #always remember this. and bcrypt. It make the passwords secure

    validates :name, presence: true
 end
 
 