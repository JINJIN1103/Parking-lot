class Board < ApplicationRecord
  belongs_to :customer
  has_many :lists, dependent: :destroy
  has_many :tasks, dependent: :destroy
  attachment :image
  
  validates :title, presence: true
end
