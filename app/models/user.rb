class User < ActiveRecord::Base
    has_many :user_subjects
    has_many :subjects, through: :user_subjects
    has_many :textbooks, through: :subjects
    has_secure_password #always  remember this. and bcrypt. It make the passwords secure
    validates :user_name, presence: true

    #we're creating a scope method for users who aren't taking subjects and labeling them inactive or active
    #maybe one with the most popular subjects

 end
 
 