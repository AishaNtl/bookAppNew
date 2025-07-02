class Book < ApplicationRecord
# Validations
validates :title, presence: true
validates :author, presence: true

# Callbacks
after_create :notify_creation
after_update :notify_update

private

def notify_creation
    BookObserver.after_create(self)
end

def notify_update
    BookObserver.after_update(self)
end
end