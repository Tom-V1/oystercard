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

end