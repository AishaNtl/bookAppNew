# class BooksController < ApplicationController
#   before_action :set_book, only: %i[ show update destroy ]

#   # GET /books
#   def index
#     @books = Book.all

#     render json: @books
#   end

#   # GET /books/1
#   def show
#     render json: @book
#   end

#   # POST /books
#   def create
#     @book = Book.new(book_params)

#     if @book.save
#       render json: @book, status: :created, location: @book
#     else
#       render json: @book.errors, status: :unprocessable_entity
#     end
#   end

#   # PATCH/PUT /books/1
#   def update
#     if @book.update(book_params)
#       render json: @book
#     else
#       render json: @book.errors, status: :unprocessable_entity
#     end
#   end

#   # DELETE /books/1
#   def destroy
#     @book.destroy!
#   end

#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_book
#       @book = Book.find(params.expect(:id))
#     end

#     # Only allow a list of trusted parameters through.
#     def book_params
#       params.expect(book: [ :title, :author, :publishing_year, :description ])
#     end
# end

# class BooksController < ApplicationController
#   before_action :set_book, only: %i[ show update destroy ]

# def index
#   @q = Book.ransack(params[:q])
#   @books = @q.result(distinct: true)
#   render json: @books
# end

#   # GET /books
#   def index
#     @books = Book.all

#     render json: @books
#   end

#   # GET /books/1
#   def show
#     render json: @book
#   end

#   # POST /books
#   def create
#     @book = Book.new(book_params)

#     if @book.save
#       render json: @book, status: :created, location: @book
#     else
#       render json: @book.errors, status: :unprocessable_entity
#     end
#   end

#   # PATCH/PUT /books/1
#   def update
#     if @book.update(book_params)
#       render json: @book
#     else
#       render json: @book.errors, status: :unprocessable_entity
#     end
#   end

#   # DELETE /books/1
#   def destroy
#     @book.destroy!
#   end

#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_book
#       @book = Book.find(params[:id])
#     end

#     # Only allow a list of trusted parameters through.
#     def book_params
#       params.require(:book).permit(:title, :author, :publishing_year, :description)
#     end
# end

# class BooksController < ApplicationController
#   before_action :set_book, only: %i[ show update destroy ]

#   def index
#     @q = Book.ransack(params[:q])
#     @books = @q.result(distinct: true)
#     render json: @books
#   end

#   # GET /books/search
#   def search
#     if params[:query].present?
#       @books = Book.where("title LIKE ? OR author LIKE ?",
#                       "%#{params[:query]}%", "%#{params[:query]}%")
#     else
#       @books = Book.all
#     end
#     render json: @books
#   end

#   # GET /books/1
#   def show
#     render json: @book
#   end

#   # POST /books
#   def create
#     @book = Book.new(book_params)

#     if @book.save
#       render json: @book, status: :created, location: @book
#     else
#       render json: @book.errors, status: :unprocessable_entity
#     end
#   end

#   # PATCH/PUT /books/1
#   def update
#     if @book.update(book_params)
#       render json: @book
#     else
#       render json: @book.errors, status: :unprocessable_entity
#     end
#   end

#   # DELETE /books/1
#   def destroy
#     @book.destroy!
#   end

#   private
#     def set_book
#       @book = Book.find(params[:id])
#     end

#     def book_params
#       params.require(:book).permit(:title, :author, :publishing_year, :description)
#     end
# end



class BooksController < ApplicationController
  before_action :set_book, only: %i[show update destroy]

  def index
    @q = Book.ransack(params[:q])
    @books = @q.result(distinct: true)
    render json: @books
  end

  def search
    if params[:query].present?
      @books = Book.where("title LIKE ? OR author LIKE ?",
                      "%#{params[:query]}%", "%#{params[:query]}%")
    else
      @books = Book.all
    end
    render json: @books
  end

  def show
    render json: @book
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      render json: @book.as_json.merge(
        message: "Book was successfully created."
      ), status: :created, location: @book
    else
      render json: {
        errors: @book.errors.full_messages,
        details: @book.errors.details
      }, status: :unprocessable_entity
    end
  end

  def update
    if @book.update(book_params)
      render json: @book.as_json.merge(
        message: "Book was successfully updated."
      )
    else
      render json: {
        errors: @book.errors.full_messages,
        details: @book.errors.details
      }, status: :unprocessable_entity
    end
  end

  def destroy
    @book.destroy!
    render json: { message: "Book was successfully destroyed." }
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :publishing_year, :description)
  end
end
