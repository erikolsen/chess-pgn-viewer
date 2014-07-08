class Move < ActiveRecord::Base
  belongs_to :game
  has_many :favorites, as: :favoritible
end
