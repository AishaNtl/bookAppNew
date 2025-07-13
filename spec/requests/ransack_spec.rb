# # spec/requests/ransack_spec.rb
# RSpec.describe "Book Search" do
# let!(:book) { Book.create(title: "Ruby Fundamentals", author: "Aisha") }

# it "filters by title" do
#     get "/books?q[title_cont]=Ruby"
#     expect(response.body).to include("Ruby Fundamentals")
# end
# end
# RSpec.describe "Book Search", type: :request do
# include Rails.application.routes.url_helpers

# it "filters by title" do
#     book = create(:book, title: "Ruby Fundamentals")
#     get books_path(q: { title_cont: "Ruby" }) # Use path helper
#     expect(response.body).to include(book.title)
# end
# end

require 'rails_helper'

RSpec.describe "Book Search", type: :request do
let!(:ruby_book) { create(:book, title: "Ruby Fundamentals", publishing_year: 2020) }
let!(:rails_book) { create(:book, title: "Rails Patterns", publishing_year: 2019) }

it "filters by title" do
    get books_path, params: { q: { title_cont: "Ruby" } }
    expect(response.body).to include(ruby_book.title)
    expect(response.body).not_to include(rails_book.title)
end
end
