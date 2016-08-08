class Atm
  attr_accessor :funds

  def initialize
    @funds = 1000
  end

  def withdraw(account, amount)
    case
    when insufficient_funds_in_account?(account, amount) then
      return
    else
      perform_withdraw(account, amount)
    end
  end

  private

  def perform_withdraw(account, amount)
    reduce_atm_funds(amount)
    reduce_the_account_balance(account, amount)
    { status: true,
      message: 'success',
      date: Date.today,
      amount: amount }
  end

  def reduce_atm_funds(amount)
    @funds -= amount
  end

  def reduce_the_account_balance(account, amount)
    account.balance -= amount
  end

  def insufficient_funds_in_account?(account, amount)
    amount > account.balance
  end
end
