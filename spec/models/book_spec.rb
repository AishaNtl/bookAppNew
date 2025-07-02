require 'rails_helper'

RSpec.describe Book, type: :model do
describe "validations" do
    it "requires title and author" do
    book = Book.new(title: nil, author: nil)
    expect(book).not_to be_valid
    expect(book.errors[:title]).to include("can't be blank")
expect(book.errors[:author]).to include("can't be blank")
    end

    it "accepts valid attributes" do
    book = Book.new(title: "Clean Code", author: "Robert Martin", publishing_year: 2008)
    expect(book).to be_valid
    end
end
end