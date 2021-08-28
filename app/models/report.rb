class Report < ApplicationRecord
    belongs_to :customer
    belongs_to :category
    
    attachment :image
end
