# require "test_helper"

# class BooksControllerTest < ActionDispatch::IntegrationTest
#   setup do
#     @book = books(:one)
#   end

#   test "should get index" do
#     get books_url, as: :json
#     assert_response :success
#   end

#   test "should create book" do
#     assert_difference("Book.count") do
#       post books_url, params: { book: { author: @book.author, description: @book.description, publishing_year: @book.publishing_year, title: @book.title } }, as: :json
#     end

#     assert_response :created
#   end

#   test "should show book" do
#     get book_url(@book), as: :json
#     assert_response :success
#   end

#   test "should update book" do
#     patch book_url(@book), params: { book: { author: @book.author, description: @book.description, publishing_year: @book.publishing_year, title: @book.title } }, as: :json
#     assert_response :success
#   end

#   test "should destroy book" do
#     assert_difference("Book.count", -1) do
#       delete book_url(@book), as: :json
#     end

#     assert_response :no_content
#   end
# end
require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  include FactoryBot::Syntax::Methods

  setup do
    @book = create(:book,
                  title: "Ruby Fundamentals",
                  author: "Jane Doe",
                  publishing_year: 2023,
                  description: "A comprehensive guide to Ruby")
  end

  test "should get index" do
    get books_url, as: :json
    assert_response :success

    books = JSON.parse(response.body)
    assert_not_empty books
    assert_equal @book.title, books.first["title"]
    assert_equal @book.publishing_year, books.first["publishing_year"]
  end

  test "should create book" do
    assert_difference("Book.count", 1) do
      post books_url,
          params: {
            book: {
              title: "New Book Title",
              author: "John Smith",
              publishing_year: 2024,
              description: "Brand new book description"
            }
          },
          as: :json
    end

    assert_response :created
    created_book = JSON.parse(response.body)
    assert_equal "New Book Title", created_book["title"]
    assert_equal 2024, created_book["publishing_year"]
  end

  test "should show book" do
    get book_url(@book), as: :json
    assert_response :success

    book_json = JSON.parse(response.body)
    assert_equal @book.id, book_json["id"]
    assert_equal "Ruby Fundamentals", book_json["title"]
    assert_equal 2023, book_json["publishing_year"]
  end

  test "should update book" do
    patch book_url(@book),
          params: {
            book: {
              title: "Updated Ruby Fundamentals",
              publishing_year: 2025,
              description: "Revised edition"
            }
          },
          as: :json

    assert_response :success
    @book.reload
    assert_equal "Updated Ruby Fundamentals", @book.title
    assert_equal 2025, @book.publishing_year
    assert_equal "Revised edition", @book.description
  end

  test "should destroy book" do
    assert_difference("Book.count", -1) do
      delete book_url(@book), as: :json
    end

    assert_response :ok
    response_body = JSON.parse(response.body)
    assert_equal "Book was successfully destroyed.", response_body["message"]
  end
end
