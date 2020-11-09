class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount
  @@all = []

  def initialize(sender, receiver, amount, status= "pending")
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = status
    @@all << self
  end
  def valid?
    @sender.valid?
    @receiver.valid?
  end
  def execute_transaction
    if self.valid? && self.status == "pending" && @amount < @sender.balance
    @sender.balance -= @amount
    @receiver.balance += @amount
    self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end   
  end
  def reverse_transfer
    if self.status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      self.status = "reversed"
    end
  end
end
