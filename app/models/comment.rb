class Comment < ApplicationRecord
  belongs_to :category
  belongs_to :post, optional: true

  validates_presence_of :author
  validates_presence_of :content
  validates_with AuthorValidator
end
