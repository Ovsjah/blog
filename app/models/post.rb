class Post < ApplicationRecord
  belongs_to :category
  has_many :comments

  validates_presence_of :name
  validates_size_of :file, maximum: 2.megabytes, message: "should be less than 2 Mb"
  validates_with NameValidator
end
