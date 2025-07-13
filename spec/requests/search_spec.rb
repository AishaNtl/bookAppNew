# require 'rails_helper'

# RSpec.describe "Book Search", type: :request do
# before do
#     Book.create(title: "Ruby Fundamentals", author: "Aisha")
#     Book.create(title: "Rails Patterns", author: "John")
# end

# it "finds books by title" do
#     get "/books?q[title_cont]=Ruby"
#     expect(response).to have_http_status(200)
#     expect(response.body).to include("Ruby Fundamentals")
#     expect(response.body).not_to include("Rails Patterns")
# end
# end

require 'rails_helper'

RSpec.describe "Book Search", type: :request do
let!(:book) { create(:book, title: "Ruby Fundamentals", publishing_year: 2020) }

it "finds books by title" do
    get search_books_path, params: { query: "Ruby" }
    expect(response.body).to include(book.title)
end
end