class PostCommentsController < ApplicationController
	def create
    book = Book.find(params[:book_id])
    comment = current_user.post_comments.new(book_params)
    comment.book_id = book.id
    if comment.save
    	redirect_to book_path(book)
    else
    	redirect_to books_path
    end
	end

	def destroy
    book = Book.find(params[:book_id])
    comment = PostComment.find(params[:id])
    if comment.destroy
    	redirect_to book_path(book)
    else
    	redirect_to  books_path
    end
    	
end
	private

	def book_params
    params.require(:post_comment).permit(:comment)
	end
end
