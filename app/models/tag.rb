class Tag < ApplicationRecord
  belongs_to :customer
  has_many :tag_maps, dependent: :destroy, foreign_key: 'tag_id'
  has_many :reports, through: :tag_maps


end
