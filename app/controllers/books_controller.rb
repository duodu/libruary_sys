class BooksController < ApplicationController
  #显示所有图书列表
  def list
    @books = Book.where("stat_id=?",0)
    @category = Category.all
    @cate_array = Category.all.map { |cate| [cate.name, cate.id] }
    if session[:user_id]
      @user = User.find(session[:user_id])
      @borrowed = Borrow.where("user_id=?",session[:user_id])
    end
  end
  #分类显示
  def list_cate
    cate_id = params[:id]
    @category = Category.all
    @books = Book.where(["category_id=?",cate_id])
    @cate_array = Category.all.map { |cate| [cate.name, cate.id] }
    if session[:user_id]
      @user = User.find(session[:user_id])
      @borrowed = Borrow.where("user_id=?",session[:user_id])
    end
    render :action => "list"
  end
  #按借阅状态显示
  def list_stat
    stat_id = params[:stat_id]
    @books = Book.where(["stat_id=?",stat_id])
  end
  #显示某一本书
  def show
    @book = Book.find(params[:id])
    if session[:user_id]
      @user = User.find(session[:user_id])
    else
      @user = nil
    end
    @comments = Comment.where("book_id=?",@book.id)
    @comment = Comment.new
  end
  #借阅图书
  def borrow
    if session[:user_id]
      @borrowed = Borrow.where("book_id=? and user_id=?",params[:id],session[:user_id]).last
      if @borrowed == nil or @borrowed.is_return == 0
        @borrow = Borrow.new
        @borrow.book_id = params[:id]
        @borrow.user_id = session[:user_id]
        @borrow.is_return = 1 #未归还
        @book = Book.find(params[:id])
        @book.storage -= 1
        date = Time.new.strftime("%Y%m%d%H%M%S")
        @book.uptime = date
        @borrow.uptime = date
        #弹出确认提示框
        #code#
        if @book.save && @borrow.save
          redirect_to :action => "list"
          flash[:notice] = ["borrow success"]
        else
          redirect_to :action => "list"
          flash[:notice] = ["borrow failed"]
          @book.errors.full_messages.each do |msg|
            flash[:notice].push msg
          end
        end
      else
        redirect_to :action => "list"
        flash[:notice] = ["You have not returned yet"]
      end
    else
      redirect_to :action => "list"
      flash[:notice] = ["You need to login first"]
    end
  end
  #归还图书
  def return
    if session[:user_id]
      @borrowed = Borrow.where("book_id=? and user_id=?",params[:id],session[:user_id]).last
      if @borrowed != nil && @borrowed.is_return == 1 
        @borrow = Borrow.new
        @borrow.is_return = 0
        @borrow.book_id = params[:id]
        @borrow.user_id = session[:user_id]
        @book = Book.find(params[:id])
        @book.storage += 1
        date = Time.new.strftime("%Y%m%d%H%M%S")
        @borrow.uptime = date
        if @borrow.save && @book.save
          redirect_to :action => "list"
          flash[:notice] = ["return success"]
        else
          redirect_to :action => "list"
          flash[:notice] = ["return failed"]
        end
      else
        redirect_to :action => "list"
        flash[:notice] = ["You have not borrow this book"]
      end
    else
      redirect_to :action => "list"
      flash[:notice] = ["You need to login first"]
    end
  end
  #添加新书
  def add_newbook
    @book = Book.new
    @cate_array = Category.all.map { |cate| [cate.name, cate.id] }
  end
  #添加新书提交
  def add_submit
    @book = Book.new(params[:book])
    @book.stat_id = 0 #可借阅状态
    date = Time.new.strftime("%Y%m%d%H%M%S")
    @book.uptime = date
    if @book.save
      redirect_to :action => "book_manage"
      flash[:notice] = ["add success"]
    else
      redirect_to :action => "add_newbook"
      flash[:notice] = @book.errors.full_messages
    end
  end
  #查看库存
  def book_manage
    @books = Book.all
  end
  #编辑书信息
  def edit_book
    @book = Book.find(params[:id])
    @cate_array = Category.all.map { |cate| [cate.name, cate.id] }
  end
  #更新书信息
  def update_book
    @book = Book.find(params[:id])
    if @book.update_attributes(params[:book])
      redirect_to :action => "book_manage"
      flash[:notice] = ["edit success"]
    else
      redirect_to :action => "edit_book", :id => @book.id
      flash[:notice] = @book.errors.full_messages
    end
  end
end
