class Journey
  attr_reader :entry_station, :exit_staiton

  PENALTY_FARE = 6

  def initialize(entry_station: nil)
    @complete = false
    @entry_station = entry_station
  end

  # def exit(station: nil)
  #   @exit_station = station
  #   @complete = true
  # end 

  def complete?
    @complete
  end

  def fare 
    return PENALTY_FARE if penalty?
    1
  end 

  def finish(station)
    @exit_staiton = station
    @complete = true
    self
  end

  def penalty?
    (!entry_station || !exit_staiton)
  end

end 