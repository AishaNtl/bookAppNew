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
    @book = create(:book)  # Creates and saves a book using FactoryBot
  end

  test "should get index" do
    get books_url, as: :json
    assert_response :success

    # Parse JSON response and verify contents
    books = JSON.parse(response.body)
    assert_not_empty books
    assert_equal @book.title, books.first["title"]
  end

  # test "should create book" do
  #   assert_difference("Book.count") do
  #     post books_url,
  #         params: {
  #           book: attributes_for(:book, title: "Book Title 4")
  #         },
  #         as: :json
  #   end
  
  test "should create book" do
  initial_count = Book.count  # Get count after setup creates first book
  
  assert_difference("Book.count", 1) do  # Explicitly expect +1
    post books_url,
        params: {
          book: attributes_for(:book, title: "Book Title 4")
        },
        as: :json
  end

  assert_response :created
  assert_equal initial_count + 1, Book.count  # Verify final count

  created_book = JSON.parse(response.body)
  assert_equal "Book Title 4", created_book["title"]
end

    assert_response :created

    # Verify the created book
    created_book = JSON.parse(response.body)
    assert_equal "Book Title 4", created_book["title"]
  end

  test "should show book" do
    get book_url(@book), as: :json
    assert_response :success

    # Verify the returned book matches
    book_json = JSON.parse(response.body)
    assert_equal @book.id, book_json["id"]
    assert_equal @book.title, book_json["title"]
  end

  test "should update book" do
    new_attributes = attributes_for(:book)  # New set of attributes

    patch book_url(@book),
          params: {
            book: new_attributes
          },
          as: :json

    assert_response :success

    # Reload and verify updates
    @book.reload
    assert_equal new_attributes[:title], @book.title
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
