
class Oystercard 

  attr_reader :balance
  # attr_reader :in_journey?
  MAX_BALANCE = 90

  def initialize
    @balance = 0
    @journey = false
  end

  def top_up(topup)
    fail "top up exceeds maximum balance of #{MAX_BALANCE}" if max(topup) 
    @balance += topup
  end 

  def deduct(amount)
    @balance -= amount
  end 

  def touch_in
    @journey = true
  end 

  def touch_out
    @journey = false
  end

  def in_journey?
    @journey
  end

  def max(topup)
    amount = @balance + topup
    return true if amount  > MAX_BALANCE
    false
  end

end