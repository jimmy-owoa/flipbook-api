module Api::V1
  class FlippingBooksController < ApiController
    before_action :set_flipping_book, only: [:show, :update, :destroy]

    # GET /flipping_books
    def index
      @flipping_books = FlippingBook.all.order(id: :desc)
      data = []
      @flipping_books.each do |flipping_book|
        data << {
          id: flipping_book.id,
          name: flipping_book.name,
          description: flipping_book.description,
          pages: flipping_book.try(:pages),
          file_url: url_for(flipping_book.file),
          image: url_for(flipping_book.images.blobs.order(:filename).first)
        }
      end
      render json: data
    end

    # GET /flipping_books/1
    def show
      images = []
      @flipping_book.images.blobs.order(:filename).each { |image| images <<  url_for(image)}
      data = { name: @flipping_book.name, description: @flipping_book.description, file: url_for(@flipping_book.file), images: images}
      render json: data
    end

    # POST /flipping_books
    def create
      @flipping_book = FlippingBook.new(flipping_book_params)
      params[:flipping_book][:images].values.each do |image|
        @flipping_book.images.attach(image)
      end
      @flipping_book.pages = @flipping_book.images.count
      if @flipping_book.save
        render json: @flipping_book, status: :created
      else
        render json: @flipping_book.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /flipping_books/1
    def update
      if @flipping_book.update(flipping_book_params)
        render json: @flipping_book
      else
        render json: @flipping_book.errors, status: :unprocessable_entity
      end
    end

    # DELETE /flipping_books/1
    def destroy
      @flipping_book.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_flipping_book
        @flipping_book = FlippingBook.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def flipping_book_params
        params.require(:flipping_book).permit(:name, :description, :pages, :file, images: [])
      end
  end
end