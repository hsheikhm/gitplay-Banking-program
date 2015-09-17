class Account
    attr_reader :name, :balance
    
    @@accounts = {}
    
    def initialize (name, balance=100)
        @name = name
        @balance = balance
        @@accounts[name] = balance
    end
    
    private
    def pin
        @pin = 1234
    end
    
    private
    def pin_error
        return "Access denied: Incorrect PIN."
    end

    public
    def display_accounts(pin_number)
      if pin_number == pin
        @@accounts.sort.map { |key, value| puts "Account: #{key} - Balance: £#{value}." }
      else
        puts pin_error
      end
    end

    public
    def display_balance(pin_number)
        puts pin_number == pin ? "Balance: £#{@balance}" : pin_error
    end
    
    public
    def transfer_money(pin_number, amount, from_account, to_account)
      if pin_number == pin
        if @@accounts[from_account].nil? || @@accounts[to_account].nil?
          puts "One of the accounts you entered does not exist!" 
        else
          @@accounts[from_account] -= amount
          @@accounts[to_account] += amount
          puts "£#{amount} has now been transferred from #{from_account} to #{to_account}."
          puts "The new balance in #{to_account} is £#{@@accounts[to_account]}."
          puts "The new balance in #{from_account} is £#{@@accounts[from_account]}."
        end
      else
        puts pin_error
      end
    end    
    
    public
    def withdraw(pin_number, amount)
        if pin_number == pin && amount <= @balance
            @balance -= amount
            puts "Withdrew £#{amount}. New balance: £#{@balance}."
        elsif amount > @balance
          puts "You do not have sufficient funds for your request. Your current balance is £#{@balance}."
        else
          puts pin_error
        end
    end
    
    public
    def deposit(pin_number, amount)
      if pin_number == pin
        @balance += amount
        puts "Deposited £#{amount}. New balance: £#{@balance}"
      else
        puts pin_error
      end
    end
    
end

checking_account = Account.new("HSBC", 1000)
checking_account = Account.new("Barclays", 2000)
checking_account = Account.new("NatWest", 3000)
checking_account = Account.new("Santander", 5000)
checking_account = Account.new("Lloyds", 8000)
checking_account = Account.new("American Express", 3000)

checking_account.transfer_money(1234, 2000, "American Express", "HSBC")
puts checking_account.name






