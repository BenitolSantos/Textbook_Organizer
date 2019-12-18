class User_Subject < ActiveRecord::Base
    belongs_to :subject
    belongs_to :user
end