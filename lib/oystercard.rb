class Oystercard

attr_reader :balance, :in_journey

MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1
MINIMUM_CHARGE = 1

  def initialize(balance = 0, in_journey = false)
    @balance = balance
    @in_journey = in_journey
  end

  def top_up(amount)
    fail "ERROR - Exceeds maximum balance of £#{MAXIMUM_BALANCE}" if @balance + amount >= MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in
    fail "ERROR - No fund please top up!" if @balance < MINIMUM_BALANCE
    @in_journey = true
  end

  def touch_out
    deduct(MINIMUM_CHARGE)
    @in_journey = false
  end

  private

  def deduct(fare)
    @balance -= fare
  end

end
