require 'rails_helper'

RSpec.describe "Books API", type: :request do
describe "GET /books" do
    let!(:book) { create(:book, title: "Test Driven Development") }

    it "returns all books" do
    get books_path
    expect(response).to have_http_status(200)
    expect(JSON.parse(response.body).first["title"]).to eq("Test Driven Development")
    end
end
end