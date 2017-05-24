# Create a class called BankAccount.
# Add a class variable called @@interest_rate that is a float representing the interest rate for all the accounts in the bank. This is a class variable because it is the same value for all accounts.
# Add another class variable called @@accounts that starts as an empty array. This will eventually store the list of all bank accounts in the bank.
# Add an initialize instance method that sets @balance to zero. You should also add an attr_accessor for balance to your class. Balance is stored in an instance variable because the value needs to be different from account to account.
# Add an instance method called deposit that accepts a number as an argument and adds that amount to the account's balance.
# This needs to be an instance method because it pertains to a single, specific account.
# Add an instance method called withdraw that accepts a number as an argument and subtracts that amount from the account's balance.
# Add a class method called create that calls BankAccount.new and adds the new object to @@accounts so that we can find it again in the future. This method should return the new account object. This needs to be a class method because at the time we run it there is no single, specific account object that we are working on.
# Add a class method called total_funds that returns the sum of all balances across all accounts in @@accounts.
# This needs to be a class method because it does not pertain to any single, specific account.
# Add a class method called interest_time that iterates through all accounts and increases their balances according to @@interest_rate.
class BankAccount
  attr_accessor :balance

  @@interest_rate = 1.2
  @@accounts = []

  def initialize
    @balance = 0
  end

  def deposit(number)
    deposit += @balance
  end

  def withdraw(number)
    @balance -= withdraw
  end

  def create
    new_account = BankAccount.new
    @@accounts << new_account
  return @@accounts
  end

  def self.total_funds
    @total_funds = 0
    @@accounts.each do |total|
    @total_funds += total.balance
    end
  end
    
  def self.interest_time
    @@accounts.each do |account|
      account.balance *= (@interest_rate)
    end
  end
end
