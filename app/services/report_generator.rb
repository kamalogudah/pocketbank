require 'prawn'
class ReportGenerator
  include Prawn::View
  def initialize(current_user)
    @name = current_user
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
greeter = Greeter.new("Gregory")
greeter.say_hello
greeter.say_goodbye
greeter.save_as("greetings.pdf")