class Player < ActiveRecord::Base
	has_many :participations
	has_many :games, through: :participations
end
