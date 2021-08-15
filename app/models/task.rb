class Task < ApplicationRecord
  belongs_to :customer
  belongs_to :board
  belongs_to :list
end
