class Memo < ApplicationRecord
  belongs_to :customer

  validates :memo, presence: true
end
