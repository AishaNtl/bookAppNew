require 'rails_helper'

RSpec.describe "Books API", type: :request do
describe 'GET /books' do
    let!(:book) { FactoryBot.create(:book, title: "Test Driven Development") }

    it 'returns all books' do
    get '/books'
    expect(response).to have_http_status(:success)
    expect(response.body).to include("Test Driven Development")
    end
end
end