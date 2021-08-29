class Report < ApplicationRecord
    belongs_to :customer
    belongs_to :category
    has_many :report_comments
    has_many :tag_maps, dependent: :destroy
    has_many :tags, through: :tag_maps

    attachment :image

 def save_tag(sent_tags,customer_id)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      self.report_tags.delete Tag.find_by(tag_name: old)
    end

    new_tags.each do |new|
      new_report_tag = Tag.find_or_create_by(tag_name: new, customer_id: customer_id)
      self.tags << new_report_tag
    end
 end

 def self.search_for(content, method)
    if method == 'perfect'
      Report.where(title_r: content)
    elsif method == 'forward'
      Report.where('title_r LIKE ?', content+'%')
    elsif method == 'backward'
      Report.where('title_r LIKE ?', '%'+content)
    else
      Report.where('title_r LIKE ?', '%'+content+'%')
    end
 end

end
