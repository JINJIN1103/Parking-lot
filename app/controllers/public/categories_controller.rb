class Public::CategoriesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @categories = Category.where(customer_id: current_customer)
    @category = Category.new
    @memos= Memo.where(customer_id: current_customer)
  end

  def create
    @category = Category.new(category_params)
    @category.customer_id = current_customer.id
    if @category.save
      flash[:notice] = "カテゴリーの登録が完了しました"
      redirect_to categories_path
    else
      @categories = Category.where(customer_id: current_customer)
      @category = Category.new
      @memos= Memo.where(customer_id: current_customer)
      render :index
    end
  end

  def edit
    @category = Category.find(params[:id])
    @memos= Memo.where(customer_id: current_customer)
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = "ジャンルの更新が完了しました"
      redirect_to categories_path
    else
      @category = Category.find(params[:id])
      @memos= Memo.where(customer_id: current_customer)
      render :edit
    end
  end

  private

  def category_params
    params.require(:category).permit(:name,:customer_id)
  end

end
