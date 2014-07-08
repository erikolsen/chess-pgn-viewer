require 'spec_helper'

describe Game do
  let (:game) {Game.new(date_played: '5-19-1983', event:'dbc floor tournament', site:'dbc floor', eco_code: 'C07')}

  context "#initialize" do
    it "creates a Game Object" do
      expect(game).to be_an_instance_of Game
    end

    it "should have a date" do
      expect(game.date_played).to eq('5-19-1983')
    end

    it "should have an event" do
      expect(game.event).to eq('dbc floor tournament')
    end

    it "should have a site" do
      expect(game.site).to eq('dbc floor')
    end

    it "should have an eco_code" do
      expect(game.eco_code).to eq('C07')
    end

    # it do
    # should allow_value('2013-01-01').
    #   for(:date_played).
    #   on(:create)
    # end

    # it do
    # should allow_value('2013-??-??').
    #   for(:date_played).
    #   on(:create)
    # end
  end

  context '#game_relationships' do
    it { should have_many(:participations) }
    it { should have_many(:moves) }
    it { should have_many(:players).through(:participations) }
    it { should have_many(:favorites) }
  end

  # context '#game_search' do

  # end
end
