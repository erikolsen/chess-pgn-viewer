require 'spec_helper'

describe User do
  context '#user_initialization' do
    it { should have_db_column(:name) }
    it { should have_db_column(:email) }
    it { should have_db_column(:uid) }
    it { should have_db_column(:provider) }
  end

  context "#user_relationships" do
    it { should have_many(:favorites) }
  end
end
