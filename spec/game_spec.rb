require 'game'

describe Game do
  it 'sets the game title' do
    game = Game.new('Knuckleheads')
    expect(game.title).to eq('Knuckleheads')
  end
end
