# require 'rails_helper'

# RSpec.describe "Books API", type: :request do
# describe "GET /books" do
#     let!(:book) { create(:book, title: "Test Driven Development") }

#     it "returns all books" do
#     get books_path
#     expect(response).to have_http_status(200)
#     expect(JSON.parse(response.body).first["title"]).to eq("Test Driven Development")
#     end
# end
# end

# require 'rails_helper'

# RSpec.describe "Books API", type: :system do
# let!(:book) { create(:book, title: "Test Driven Development", publishing_year: 2010) }

# it "shows book details" do
#     visit books_path
#     expect(page).to have_content(book.title)
#     expect(page).to have_content(book.author)
#     expect(page).to have_content(book.publishing_year)
# end
# end

require 'rails_helper'

RSpec.describe "Books API", type: :system do
let!(:book) { create(:book, title: "Test Driven Development",
                            author: "Jane Doe",
                            publishing_year: 2010) }

it "shows book details" do
    visit books_path
    expect(page).to have_content(book.title)
    expect(page).to have_content(book.author)
    expect(page).to have_content(book.publishing_year)
end
end
