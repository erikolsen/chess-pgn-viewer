require 'spec_helper'

describe Favorite do
  context '#favorite_initialization' do
    it { should have_db_column(:user_id) }
    it { should have_db_column(:favoritible_id) }
    it { should have_db_column(:favoritible_type) }
  end

  context "#favorite_relationships" do
    it { should belong_to(:favoritible) }
    it { should belong_to(:user) }
  end
end
