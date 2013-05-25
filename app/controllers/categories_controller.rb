class CategoriesController < ApplicationController
  #添加分类
  def add_cate
    @cate = Category.new
  end
  #添加分类提交
  def add_cate_submit
    @cate = Category.new(params[:category])
    if @cate.save
      redirect_to :action => "show_cate"
      flash[:notice] = ["add success"]
    else
      redirect_to :action => "add_cate"
      flash[:notice] = @cate.errors.full_messages
    end   
  end
  #显示分类
  def show_cate
    @cates = Category.all
  end
  #编辑分类
  def edit_cate
    @cate = Category.find(params[:id])
  end
  #编辑分类提交
  def update_cate
    @cate = Category.find(params[:id])
    if @cate.update_attributes(params[:category])
      redirect_to :action => "show_cate"
      flash[:notice] = ["update success"]
    else
      redirect_to :action => "edit_cate", :id => @cate.id
      flash[:notice] = @cate.errors.full_messages
    end
  end
  #删除分类
  def delete_cate
    @cate = Category.find(params[:id])
    if @cate.destroy
      redirect_to :action => "show_cate"
      flash[:notice] = ["delete seccuss"]
    else
      redirect_to :action => "show_cate"
      flash[:notice] = ["delete failed"]
    end
  end
end