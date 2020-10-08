require 'pry'
require_relative "./bank_account.rb"
class Transfer

attr_reader :sender, :receiver
attr_accessor :status, :amount 

def initialize(sender, receiver, amount, status="pending")
  @sender = sender 
  @receiver = receiver 
  @status = status
  @amount = amount 
end 

def valid?
  @sender.valid?
  @receiver.valid?
end 

def execute_transaction
  if self.valid? && self.status == "pending" && @sender.balance >= @amount
  @sender.balance -= @amount
  @receiver.balance += @amount 
  @status = "complete"
else
  @status = "rejected"
  return "Transaction rejected. Please check your account balance."
end 
end 

def reverse_transfer
  if @status == "complete"
  @receiver.balance -= @amount
  @sender.balance += @amount
  @status = "reversed"
  end 
end 

end
