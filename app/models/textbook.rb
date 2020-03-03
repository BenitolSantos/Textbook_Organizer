class Textbook < ActiveRecord::Base
  belongs_to :subject
  validates :title, presence: true

  scope :expensive, where("cost > ?", 300)
  scope :inexpensive, where("cost < ?", 300)

  #fix the scope method it doesn't work
end
