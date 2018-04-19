require 'prawn'
class ReportGenerator
  include Prawn::View
  def initialize(users)
    @name = users
  end

  def title
    text "Transactions Report"
  end

  def body
    font("Courier") do
      text "Goodbye, #{@name}!"
    end
  end

end
