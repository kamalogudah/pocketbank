class Transaction < ApplicationRecord
  # include RailsAdminCharts
  belongs_to :user, optional: true
  belongs_to :account, optional: true
  belongs_to :category, optional: true

  def build_default_category
    build_category(name: "Send Money")
    true
  end
end
