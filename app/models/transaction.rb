class Transaction < ApplicationRecord
   include RailsAdminCharts
  belongs_to :user, optional: true
  belongs_to :account, optional: true
  belongs_to :category, optional: true
  validates :amount, numericality: true


end
