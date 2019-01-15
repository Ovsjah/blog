class Post < ApplicationRecord
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_one_attached :file

  validates_presence_of :name
  validate :file_size
  validates_with NameValidator

  def file_size
    if file.attached?
      if file.blob.byte_size > 2000000
        file.purge
        errors[:file] << 'is over 2Mb'
      end
    end
  end
end
