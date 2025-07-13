# class Book < ApplicationRecord
# # Validations
# validates :title, presence: true
# validates :author, presence: true

# # Callbacks
# after_create :notify_creation
# after_update :notify_update

# private

# def notify_creation
#     BookObserver.after_create(self)
# end

# def notify_update
#     BookObserver.after_update(self)
# end
# end

# class Book < ApplicationRecord
# # Validations
# validates :title, presence: true
# validates :author, presence: true

# # Ransack Configuration
# def self.ransackable_attributes(auth_object = nil)
#     ["author", "created_at", "description", "id", "publishing_year", "title", "updated_at"]
# end

# def self.ransackable_associations(auth_object = nil)
#     []
# end

# # Callbacks
# after_create :notify_creation
# after_update :notify_update

# private

# def notify_creation
#     BookObserver.after_create(self)
# end

# def notify_update
#     BookObserver.after_update(self)
# end
# end

class Book < ApplicationRecord
# Validations
validates :title, presence: true,
                    length: { maximum: 100 },
                    uniqueness: { case_sensitive: false }

validates :author, presence: true,
                    length: { maximum: 50 },
                    format: { with: /\A[a-zA-Z\s\-']+\z/, message: "only allows letters, spaces, hyphens, and apostrophes" }

validates :publishing_year, presence: true,
                            numericality: {
                                only_integer: true,
                                greater_than_or_equal_to: 1800,
                                less_than_or_equal_to: Date.current.year
                            }

validates :description, length: { maximum: 1000 }, allow_blank: true

# Ransack Configuration
def self.ransackable_attributes(auth_object = nil)
    %w[author created_at description id publishing_year title updated_at]
end

def self.ransackable_associations(auth_object = nil)
    []
end

# Callbacks
after_create :notify_creation
after_update :notify_update

# Custom validation example
validate :title_cannot_contain_invalid_words

private

def notify_creation
    BookObserver.after_create(self)
end

def notify_update
    BookObserver.after_update(self)
end

def title_cannot_contain_invalid_words
    invalid_words = [ "free", "download", "pdf" ] # Example list
    if title.present? && invalid_words.any? { |word| title.downcase.include?(word) }
    errors.add(:title, "contains invalid words")
    end
end
end
