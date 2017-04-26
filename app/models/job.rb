class Job < ApplicationRecord
   belongs_to :user
   validates :title, presence: true
   validates :max, presence: true
   validates :min, presence: true
   validates :min, numericality: { greater_than: 0}
end
