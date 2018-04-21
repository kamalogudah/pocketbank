class Account < ApplicationRecord
  include RailsAdminCharts
  belongs_to :user, optional: true
  has_many :transactions
end
