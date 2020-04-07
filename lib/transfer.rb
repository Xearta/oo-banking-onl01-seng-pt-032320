require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if valid? && self.status == "pending"
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
    else
      #puts "REJECTED"
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
    #puts "#{self.sender.name} + #{self.sender.balance} + #{self.sender.status}| #{self.receiver.name} + #{self.receiver.balance} + #{self.receiver.status}"
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
    end
  end

end
