require "oystercard"

describe Oystercard do 

  describe "#balance" do

    it "has a balance of zero" do
      expect(subject.balance).to eq(0)
    end
  end

  # ==============================================

  describe "#top_up" do

    it {is_expected.to respond_to(:top_up).with(1).argument}

    it "prevents top up exceeding maximum amount" do
      max_balance = Oystercard::MAX_BALANCE
      subject.top_up(max_balance)
      expect{subject.top_up(1)}.to raise_error "top up exceeds maximum balance of #{max_balance}"
    end
    

    it "can top up balance" do 
      subject.top_up(50)
      expect(subject.balance).to eq(50)
    end 

  end
  
 # ==============================================
  describe  "#touch in/out" do 
    let(:entry_station){double :station}
    let(:exit_station){double :station}


    it "starts not in journey" do
      expect(subject).not_to be_in_journey
    end

    it "can touch_in" do 
      subject.top_up(Oystercard::MAX_BALANCE)
      subject.touch_in(entry_station)
      expect(subject).to be_in_journey
    end 

    it "can touch_out" do
      subject.top_up(Oystercard::MAX_BALANCE)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject).not_to be_in_journey
    end

    it "checks that card has enough balance" do
      expect{subject.touch_in(entry_station)}.to raise_error "a minimum balance of £#{Oystercard::FAIR} is requried"
    end

    it "deducts fair on touch_out" do 
      subject.top_up(Oystercard::MAX_BALANCE)
      subject.touch_in(entry_station)
      expect{subject.touch_out(exit_station)}.to change{subject.balance}.by -Oystercard::FAIR
    end

  end
 # ==============================================
  describe "#stations" do 
    let(:entry_station){double :station}
    let(:exit_station){double :station}
    let(:journey){ {entry_station: entry_station, exit_station: exit_station} }
    

    it "remembers entry station" do
      subject.top_up(Oystercard::MAX_BALANCE)
      subject.touch_in(entry_station)
      expect(subject.entry_station).to eq entry_station
    end

    it "starts with a empty journey list" do 
      expect(subject.journeys).to be_empty
    end 

    it "stores a journey" do
      subject.top_up(Oystercard::MAX_BALANCE)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.journeys).to include journey
    end

  end

end