class Category < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates_presence_of :name
  validates_with NameValidator
end
