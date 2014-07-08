require 'spec_helper'

describe Player do
  let (:player) {Player.new(name: "Gary Kasparov")}

  context "#initialize" do
    it "creates a Player Object" do
      expect(player).to be_an_instance_of Player
    end

    it "has a first name" do
      expect(player.name).to eq("Gary Kasparov")
    end
  end

  context '#player_relationships' do
    it { should have_many(:participations) }
    it { should have_many(:games).through(:participations) }
  end
end