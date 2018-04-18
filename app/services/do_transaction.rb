class ConvertProspectToCustomer
  include ActiveModel::Model
  attr_reader :account, :amount, :recipient

  def initialize(**args)
    @account = account
    @customer_id = customer_id
    @prospect_id = prospect_id
    @add_as_contact = add_as_contact
  end

  def transact!
    account_transaction
  end

  private

  def account_transaction
    Transaction.create(
      date: DateTime.now,
      amount: amount,
      transaction_type: transaction_type
    )
  end


  def transfer(account, recipient, amount)
    return false unless amount_valid?(amount)
    ActiveRecord::Base.transaction do
      withdraw(account, amount)
      deposit(recipient, amount)
    end
  end

  def withdraw(account, amount)
    return false unless amount_valid?(amount)
    account.balance = (account.balance -= amount).round(2)
    account.save!
  end


  def deposit(account, amount)
    return false unless amount_valid?(amount)
    account.balance = (account.balance += amount).round(2)
    account.save!
  end

 
end

