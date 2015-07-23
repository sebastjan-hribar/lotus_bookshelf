module Web::Controllers::Books
  class Create
    include Web::Action
    
    params do
      param :book do
        param :title,  presence: true
        param :author, presence: true
      end
    end

    #expose :book

    def call(params)
      if params.valid?
        book = Book.new(params[:book])
        BookRepository.create(book)

        redirect_to '/books'
      end
    end
  end
end