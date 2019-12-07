class Textbook < ActiveRecord::Base
  has_many :subjects
  has_many :users, through: :subjects
  validates :title, presence: true
end
