class DoTransaction
  attr_reader :account, :amount, :recipient

  def initialize(account, amount, recipient)
    @account = account
    @amount = amount
    @recipient = recipient
  end

  def transfer
    return false unless amount_valid?(amount)
    
      withdraw(account, amount)
      deposit(recipient_account, amount)
    
  end

  private

  def account_transaction
    Transaction.create(
      date: DateTime.now,
      amount: amount,
      recipient: recipient
    )
  end

  def withdraw(account, amount)
    return false unless amount_valid?(amount)
    account.balance = (account.balance - amount)
    account.save!
  end


  def deposit(recipient_account, amount)
    account = recipient_account
    return false unless amount_valid?(amount)
    account.balance = (account.balance + amount)
     account.save!
  end

  def recipient_account
    User.find_by(email: recipient).account
  end
  
  def amount_valid?(amount)
    if amount <= 0
      puts 'Transaction failed! Amount must be greater than 0.00'
      return false
    end
    return true
  end
 end


