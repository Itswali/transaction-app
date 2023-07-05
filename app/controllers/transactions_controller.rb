class TransactionsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @category_transaction = Transaction.where(category_id: params[:category_id])
    @transactions = @category.transactions.order(created_at: :desc)
    @total_amount = @category.transactions.sum(:amount)
  end

  def new
    @category = Category.find(params[:category_id])
    @transaction = Transaction.new
  end

  def create
    @category = Category.find(params[:category_id])
    @transaction = @category.transactions.new(transaction_params)
    if @transaction.save
      redirect_to category_transactions_path(@category), notice: 'Transaction created successfully.'
    else
      render :new
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:name, :amount, :category_id)
  end
end
