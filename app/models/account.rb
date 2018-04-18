class Account < ApplicationRecord
  belongs_to :user
  has_many :transactions
  

  def open(params)
    account = new(params)
    puts "Creating a account with #{account.attributes}"
    account.save!
  end


  

 


  private
  def amount_valid?(amount)
    if amount <= 0
      puts 'Transaction failed! Amount must be greater than 0.00'
      return false
    end
    return true
  end
end
