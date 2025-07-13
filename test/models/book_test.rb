# require "test_helper"

# class BookTest < ActiveSupport::TestCase
#   # test "the truth" do
#   #   assert true
#   # end
# end
require "test_helper"

class BookTest < ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods

  test "should not save without title" do
    book = build(:book, title: nil)
    assert_not book.valid?
  end
end
