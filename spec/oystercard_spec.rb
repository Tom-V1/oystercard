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

    it "can top up balance" do 
      subject.top_up(50)
      expect(subject.balance).to eq(50)
    end 

  end

end