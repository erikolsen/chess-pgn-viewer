require 'spec_helper'

describe Move do
  context '#move_relationships' do
    it { should have_db_column(:iteration) }
    it { should have_db_column(:board_position) }
    it { should have_db_column(:notation)}
    it { should have_db_column(:game_id)}
  end

  context "#move_relationships" do
    it { should belong_to(:game) }
    it { should have_many(:favorites) }
  end
end
