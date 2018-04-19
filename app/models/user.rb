class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :transactions
  has_many :reports
  has_one :account
  before_create :build_default_account

  def build_default_account
    build_account
    true
  end
end
