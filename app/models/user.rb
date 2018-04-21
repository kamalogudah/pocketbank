class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :transactions
  has_one :account
  after_create :build_default_account

  def build_default_account
    build_account(number: User.last.email ,balance: 1000)
    true
  end
end
