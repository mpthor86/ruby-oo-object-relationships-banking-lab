require 'pry'
class BankAccount
    attr_accessor :balance, :status
    attr_reader :name
    @@all = []

    def initialize(name, balance = 1000, status = "open")
        @name = name
        @balance = balance
        @status = status
        @@all << self
    end
    def deposit(money)
        deposit = money.to_i
        self.balance += deposit
    end
    def display_balance
        "Your balance is $#{self.balance}."
    end
    def valid?
        true 
        if self.balance > 0
            self.status == "open"
        else false
        end
    end
    def close_account
        self.status = "closed"
    end
end
#binding.pry