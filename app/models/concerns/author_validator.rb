class AuthorValidator < ActiveModel::Validator
  include Proper

  def validate(record)
    unless proper?(record.author) &&
      record.author.split.all? { |word| word.starts_with?(/[A-Z]/) }
        record.errors.add(:name, "Min 2 words with 2 letters, should include `.`, all words should start with capitals.")
    end
  end
end
