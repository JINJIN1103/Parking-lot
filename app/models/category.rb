class Category < ApplicationRecord
    belongs_to :customer
    has_many :reports
end
