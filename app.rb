require "./lib/oystercard.rb"

p card = Oystercard.new 


p card.top_up(90)

p card.touch_in("station_1")

p card.touch_out("station_2")





