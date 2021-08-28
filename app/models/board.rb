class Board < ApplicationRecord
  belongs_to :customer
  has_many :lists
  has_many :tasks
  attachment :image
end
