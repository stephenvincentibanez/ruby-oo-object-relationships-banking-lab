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

end
