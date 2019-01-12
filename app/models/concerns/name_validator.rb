class NameValidator < ActiveModel::Validator
  include Proper

  def validate(record)
    unless proper?(record.name) && record.name.starts_with?(/[A-Z]/)
      record.errors.add(:name, "Min 2 words with 2 letters, should include `.` and should start with a capital.")
    end
  end
end
