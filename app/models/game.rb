class Game < ActiveRecord::Base
  has_many :participations
  has_many :moves
  has_many :players, through: :participations
  has_many :favorites, as: :favoritible
end
