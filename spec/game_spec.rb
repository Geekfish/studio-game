require 'game'

describe Game do
  before do
    @game = Game.new('Knuckleheads')
  end

  context 'when it is created' do
    it 'sets the game title' do
      game = Game.new('Knuckleheads')
      expect(game.title).to eq('Knuckleheads')
    end
  end

  context 'being played with one player' do
    before do
      @initial_health = 83
      @player = Game::Player.new('bobby', @initial_health)
      @game.add_player(@player)
    end

    it 'blams player if the roll is low' do
      allow(@game).to receive(:roll_die) { 5 }
      @game.play
      expect(@player.health).to eq(@initial_health - 10)
    end

    it 'w00ts player if the roll is high' do
      allow(@game).to receive(:roll_die) { 17 }
      @game.play
      expect(@player.health).to eq(@initial_health + 15)
    end

    it 'does nothing when the rolls is medium' do
      allow(@game).to receive(:roll_die) { 10 }
      @game.play
      expect(@player.health).to eq(@initial_health)
    end
  end
end
