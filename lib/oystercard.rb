
class Oystercard 

  attr_reader :balance
  attr_reader :entry_station
  MAX_BALANCE = 90
  FAIR = 1

  def initialize
    @balance = 0
  end

  def top_up(topup)
    fail "top up exceeds maximum balance of #{MAX_BALANCE}" if max(topup) 

    @balance += topup
  end 

  def touch_in(station)
    fail "a minimum balance of £#{FAIR} is requried" if balance_check

    @entry_station = station
  end 

  def touch_out
    deduct(FAIR)
    @entry_station = nil
  end

  def in_journey?
    !!entry_station
  end

  def balance_check
    return false if @balance >= FAIR
    true
  end

  def max(topup)
    amount = @balance + topup
    return true if amount  > MAX_BALANCE
    false
  end 

  private

  def deduct(amount)
    @balance -= amount
  end 

end