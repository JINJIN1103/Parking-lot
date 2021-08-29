class Task < ApplicationRecord
  belongs_to :customer
  belongs_to :board
  belongs_to :list

  def self.search_for(content, method)
    if method == 'perfect'
      Task.where(title_t: content)
    elsif method == 'forward'
      Task.where('title_t LIKE ?', content+'%')
    elsif method == 'backward'
      Task.where('title_t LIKE ?', '%'+content)
    else
      Task.where('title_t LIKE ?', '%'+content+'%')
    end
  end

end
