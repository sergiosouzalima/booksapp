class Books::LikesController < ApplicationController
  before_action :set_book

  def create
    @book.likes.create
    respond_to do |format|
      #format.html { redirect_to @book }
      format.js
    end
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end
end
