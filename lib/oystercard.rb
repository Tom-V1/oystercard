
class Oystercard 

  attr_reader :balance
  MAX_BALANCE = 90

  def initialize
    @balance = 0
  end

  def top_up(topup)
    fail "top up exceeds maximum balance of #{MAX_BALANCE}" if max(topup) 
    @balance += topup
  end 

  def deduct(amount)
    @balance -= amount
  end 

  def max(topup)
    amount = @balance + topup
    return true if amount  > MAX_BALANCE
    false
  end

end