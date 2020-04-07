class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    #if BankAccount.sender.valid? && BankAccount.receiver.valid?
    self.sender.valid?
  end
end
