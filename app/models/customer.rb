class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :boards,dependent: :destroy
  has_many :lists,dependent: :destroy
  has_many :tasks,dependent: :destroy
  has_many :memos,dependent: :destroy
  has_many :diaries,dependent: :destroy
  has_many :reports,dependent: :destroy
  has_many :report_comments,dependent: :destroy
  has_many :tags,dependent: :destroy
  has_many :tag_maps,dependent: :destroy

end
