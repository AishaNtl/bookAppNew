# require 'rails_helper'

# RSpec.describe Book, type: :model do
# describe "validations" do
#     it "requires title and author" do
#     book = Book.new(title: nil, author: nil)
#     expect(book).not_to be_valid
#     expect(book.errors[:title]).to include("can't be blank")
# expect(book.errors[:author]).to include("can't be blank")
#     end

#     it "accepts valid attributes" do
#     book = Book.new(title: "Clean Code", author: "Robert Martin", publishing_year: 2008)
#     expect(book).to be_valid
#     end
# end
# end




# require 'rails_helper'

# RSpec.describe Book, type: :model do
# describe "validations" do
#     it "requires title and author" do
#     book = Book.new(title: nil, author: nil)
#     expect(book).not_to be_valid
#     expect(book.errors[:title]).to include("can't be blank")
#     expect(book.errors[:author]).to include("can't be blank")
#     end

#     it "accepts valid attributes" do
#     book = Book.new(title: "Clean Code", author: "Robert Martin", publishing_year: 2008)
#     expect(book).to be_valid
#     end
# end

# describe "ransack configuration" do
#     it "allows searching on specific attributes" do
#     expect(Book.ransackable_attributes).to match_array(
#         ["author", "created_at", "description", "id", "publishing_year", "title", "updated_at"]
#     )
#     end

#     it "has no searchable associations" do
#     expect(Book.ransackable_associations).to be_empty
#     end
# end

# describe "callbacks" do
#     let(:book) { build(:book) }

#     it "triggers after_create callback" do
#     expect(book).to receive(:notify_creation)
#     book.save!
#     end

#     it "triggers after_update callback" do
#     book.save!
#     expect(book).to receive(:notify_update)
#     book.update!(title: "Updated Title")
#     end
# end
# end - add back post testing

# require 'rails_helper'

# RSpec.describe Book, type: :model do
# describe "Ransack search" do
#     let!(:ruby_book) { create(:book, title: "Ruby Programming", author: "Matz") }
#     let!(:rails_book) { create(:book, title: "Rails Patterns", author: "John Doe") }

#     it "searches by title" do
#     results = Book.ransack(title_cont: "Ruby").result
#     expect(results).to include(ruby_book)
#     expect(results).not_to include(rails_book)
#     end

#     it "searches by author" do
#     results = Book.ransack(author_cont: "John").result
#     expect(results).to include(rails_book)
#     end

#     it "returns empty for no matches" do
#     expect(Book.ransack(title_cont: "Python").result.count).to eq(0)
#     end

#     it "maintains default scopes" do
#     # Test with additional conditions if needed
#     results = Book.where(author: "Matz").ransack(title_cont: "Ruby").result
#     expect(results.count).to eq(1)
#     end
# end
# end

require 'rails_helper'

RSpec.describe Book, type: :model do
it "validates title presence" do
    book = Book.new(title: nil)
    expect(book).not_to be_valid
    expect(book.errors[:title]).to include("can't be blank")
end
end
