class Public::CategoriesController < ApplicationController

  before_action :authenticate_customer!

  def index
    @categories = Category.all
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.customer_id = current_customer.id
    if @category.save
      flash[:notice] = "カテゴリーの登録が完了しました"
      redirect_to categories_path
    else
       @categories = Category.all
       render :index
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = "ジャンルの更新が完了しました"
      redirect_to categories_path
    else
      render :edit
    end
  end

  private

  def category_params
    params.require(:category).permit(:name,:customer_id)
  end

end
