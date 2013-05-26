class UsersController < ApplicationController
  #查看用户信息
  def show
    @user=User.find(params[:id])
  end
  #编辑用户信息
  def edit
    @user=User.find(params[:id])
    if @user.id != session[:user_id]
      redirect_to :controller => "books", :action => "list"
      flash[:notice] = ["You are not the one"]
    end
  end
  #编辑用户信息提交
  def edit_submit
    @user=User.find(params[:id])
    if @user.id == session[:user_id]
      if @user.update_attributes(params[:user])
        redirect_to :controller => "books", :action => "list"
        flash[:notice] = ["Successfully edited"]
      else
        redirect_to :action => "edit", :id => @user.id
        flash[:notice] = @user.errors.full_messages
      end
    else
      redirect_to :controller => "books", :action => "list"
      flash[:notice] = ["You are not the one!"]
    end
  end
  #注册用户
  def reg
    @user=User.new
  end
  #注册提交
  def reg_submit
    @user=User.new(params[:user])
    if @user.save
      session[:user_id]=@user.id
      redirect_to :controller => "books", :action => "list"
      flash[:notice] = ["Successfully registed"]
    else
      render :action => "reg"
    end
  end
  #登录
  def login
    uname=params[:username]
    upass=params[:password]
    user=User.find_by_username_and_password(uname,upass)
    reset_session
    if user
      session[:user_id]=user.id
      @user=User.find(user.id)
      flash[:notice] = ["Successfully login"]
      redirect_to :controller => "books", :action => "list"
    else
      redirect_to :controller => "books", :action => "list"
      flash[:notice] = ["login failed"]
    end
  end
  #注销用户
  def logout
    reset_session
    redirect_to :controller => "books", :action => "list"
  end
  #查看历史记录
  def history
    if session[:user_id]
      @user = User.find(session[:user_id])
      if !Borrow.where("user_id=?",session[:user_id]).empty?
        @borrow_his = Borrow.where("user_id=?",session[:user_id])
      end
    else
      redirect_to :controller => "books", :action => "list"
      flash[:notice] = ["You need to login first"] 
    end
  end
  #管理员登录
  def admin_login
    uname = params[:username]
    upass = params[:password]
    reset_session
    if uname == "admin" && upass == "admin"
      session[:admin] = "admin"
      redirect_to :controller => "books", :action => "book_manage"
    else
      render :action => "admin_login"
    end
  end
end
