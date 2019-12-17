class Textbook < ActiveRecord::Base
  belongs_to :subject
  has_many :users, through: :subjects
  validates :title, presence: true
end
