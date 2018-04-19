class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = Transaction.all
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
    @categories = Category.all.map{|c| [ c.name, c.id ] }
  end

  # GET /transactions/1/edit
  def edit
    @categories = Category.all.map{|c| [ c.name, c.id ] }
  end

  def create
    @transaction = Transaction.new(transaction_params)
    account = current_user.account
    amount = @transaction.amount
    recipient = @transaction.recipient
    @user_recipient = User.find_by(email: recipient)
    DoTransaction.new(account, amount, recipient).transfer
    @transaction.category_id = params[:category_id]
    binding.pry
    respond_to do |format|
      if @transaction.save
        UserMailer.received_money(@user_recipient).deliver_now
        flash[:info] = "Please check your email to activate your account."
        format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
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

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
 

  private

  def account_transaction(account, amount, recipient)
    @account_transaction ||= DoTransaction.new(
      account,
      amount,
      recipient)
    @account_transaction.transfer
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:date, :amount, :from, :to, :user_id, :account_id, :recipient)
    end
end
