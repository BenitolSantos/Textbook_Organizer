class Textbook < ActiveRecord::Base
  belongs_to :subject
  has_many :current_pages
  has_many :users, through: :current_pages
  validates :title, presence: true
end
