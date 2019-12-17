class User_Subject < ActiveRecord::Base
    belongs_to :subject
    belongs_to :users
    validates :title, presence: true
end