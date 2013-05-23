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
    end   
  end
  #显示分类
  def show_cate
    @cates = Category.all
  end
end
