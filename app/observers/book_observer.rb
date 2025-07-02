class BookObserver
def self.after_create(book)
    puts "Observer: New book created - #{book.title} by #{book.author}"

end

def self.after_update(book)
    puts "Observer: Book updated - #{book.title} (ID: #{book.id})"
end
end