require 'pgn'
require 'faker'

# Parse FEN
def parse_fen(fen)
  output = ''
  fen.each_char do |char|
    next if char == '/'
    break if char == ' '
    if char.match(/\d/)
      output << "0" * char.to_i
    else
      output << char
    end
  end
  return output
end

# Populate games variable
# games = PGN.parse(File.read('public/WCC.pgn'))
games = PGN.parse(File.read('public/Karpov.pgn'))

# Iterating through each game
games.each do |game|
  positions = game.fen_list # Total amount of board instances
  moves = game.moves # All the moves for the game
  tags = game.tags # Tags for the game
  positions.shift # Drop first position
  pos_count = positions.count # Total amount of positions

  game = Game.create!(date_played: tags['EventDate'], event: tags['Event'], site: tags['Site'], eco_code: tags['ECO'])

  pos_count.times do |i|
    clean_fen = parse_fen(positions[i])
    Move.create!(iteration: i + 1, board_position: clean_fen, game_id: game.id, notation: moves[i])
  end

  w_player = Player.create(name: tags['White'])

  b_player = Player.create(name: tags['Black'])

  w_player_participation = Participation.create(game_id: game.id, player_id: w_player.id, color: "White", result: tags['Result'])

  b_player_participation = Participation.create(game_id: game.id, player_id: b_player.id, color: "Black", result: tags['Result'])
end

20.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email, uid: Faker::Lorem.word, provider: 'google')
end

100.times do
  Favorite.create(user_id: rand(1..20), favoritible_id: rand(1..2), favoritible_type: 'Game')
end