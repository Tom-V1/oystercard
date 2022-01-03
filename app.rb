require "./lib/oystercard.rb"

p card = Oystercard.new 

p card.top_up(90)

p card.deduct(10)

p card

