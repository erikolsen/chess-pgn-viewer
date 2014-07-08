require 'spec_helper'

describe Participation do
   let(:participation) { Participation.new(game_id: 1,
                                           player_id: 1,
                                           color: "White",
                                           result: "Win",
                                           rating: "2230") }
  context "#initialize" do
    it "creates a Participation object" do
      expect(participation).to be_an_instance_of Participation
    end

    it "should have a game_id" do
      expect(participation.game_id).to eq 1
    end

    it "should have a player_id" do
      expect(participation.player_id).to eq 1
    end

    it "should have a color" do
      expect(participation.color).to eq "White"
    end

    it "should have a result" do
      expect(participation.result).to eq "Win"
    end

    it "should have a rating" do
      expect(participation.rating).to eq "2230"
    end

    it 'should respond to rating' do
      expect(participation.attributes).to include('rating')
    end
  end # context #initialize end

  context "#participation_relationships" do
    it { should belong_to(:player) }
    it { should belong_to(:game) }
  end # context #associations end
end # describe Participation end
