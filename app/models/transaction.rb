class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :report
  belongs_to :account
end
