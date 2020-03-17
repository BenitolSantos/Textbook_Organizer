class Textbook < ActiveRecord::Base
  belongs_to :subject
  validates :title, presence: true

  scope :inexpensive, -> { where("cost <= 100") }
  scope :expensive, -> { where("cost > 100") }


end
