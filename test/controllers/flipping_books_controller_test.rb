require 'test_helper'

class FlippingBooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @flipping_book = flipping_books(:one)
  end

  test "should get index" do
    get flipping_books_url, as: :json
    assert_response :success
  end

  test "should create flipping_book" do
    assert_difference('FlippingBook.count') do
      post flipping_books_url, params: { flipping_book: { description: @flipping_book.description, name: @flipping_book.name, pages: @flipping_book.pages } }, as: :json
    end

    assert_response 201
  end

  test "should show flipping_book" do
    get flipping_book_url(@flipping_book), as: :json
    assert_response :success
  end

  test "should update flipping_book" do
    patch flipping_book_url(@flipping_book), params: { flipping_book: { description: @flipping_book.description, name: @flipping_book.name, pages: @flipping_book.pages } }, as: :json
    assert_response 200
  end

  test "should destroy flipping_book" do
    assert_difference('FlippingBook.count', -1) do
      delete flipping_book_url(@flipping_book), as: :json
    end

    assert_response 204
  end
end
