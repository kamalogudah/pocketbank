class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  def index
    @transactions = current_user.transactions
  end

  def show
  end

  def new
    @transaction = Transaction.new
    @categories = Category.all.map{|c| [ c.name, c.id ] }
  end

  def edit
    @categories = Category.all.map{|c| [ c.name, c.id ] }
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @account = current_user.account
    @amount = @transaction.amount
    recipient = @transaction.recipient
    @user_recipient = User.find_by(email: recipient)
    DoTransaction.new(@account, @amount, recipient).transfer
    # @transaction.category.id = params[:category_id]
    @transaction.user_id = current_user.id
    @transaction.account_id = current_user.account.id
      respond_to do |format|
      if @transaction.save
        UserMailer.received_money(current_user, @user_recipient, @amount).deliver_now
        UserMailer.sent_money(current_user, @user_recipient, @amount).deliver_now
        flash[:info] = "Please check your email to activate your account."
        format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @transaction.category_id = params[:category_id]
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
 

  private

  
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:date, :amount, :user_id, :account_id, :recipient)
    end
end
