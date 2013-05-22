class BooksController < ApplicationController
  #显示所有图书列表
  def list
    @books = Book.where(["storage>?",0])
  end
  #分类显示
  def list_cate
    cate_id = params[:cate_id]
    @books = Book.where(["category_id=?",cate_id])
  end
  #按借阅状态显示
  def list_stat
    stat_id = params[:stat_id]
    @books = Book.where(["stat_id=?",stat_id])
  end
  #显示某一本书
  def show
    @book = Book.find(params[:id])
  end
  #借阅图书
  def borrow
    @borrow = Borrow.new
    @borrow.book_id = params[:id]
    #@borrow.user_id = session[:user_id]
    @borrow.is_return = 1
    @borrow.storage -= 1
    #弹出确认提示框
    #code#
    @borrow.save
    #其他分支
  end
  #归还图书
  def return
    @borrow = Borrow.find(params[:id])
    @borrow.is_return = 0
    @borrow.storage += 1
    @borrow.save
  end
  #添加书评
  def book_comment
    @comment = Comment.new
  end
  #添加书评提交
  def book_comment_submit
    @comment = Comment.new(params[:comment])
    @comment.book_id = params[:id]
    @comment.save
  end
  #添加新书
  def add_newbook
    @book = Book.new
  end
  #添加新书提交
  def add_submit
    @book = Book.new(params[:book])
  end
  #添加库存
  def add_storage
    @book = Book.find(params[:id])
    @book.storage += 1
    @book.save
  end
  #减少库存
  def sub_storage
    @book = Book.find(params[:id])
    @book.storage -= 1
    @book.save
  end
  #查看库存
  def book_storage
    @books = Book.all
  end
end
