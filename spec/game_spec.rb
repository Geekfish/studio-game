require 'game'
require 'game/die'
require 'game/turn'

describe Game do
  before do
    @game = Game.new('Knuckleheads')
  end

  def fake_roll(result)
    allow_any_instance_of(Die).to receive(:roll) { result }
  end

  context 'when it is created' do
    it 'sets the game title' do
      game = Game.new('Knuckleheads')
      expect(game.title).to eq('Knuckleheads')
    end
  end

  context 'being played with one player' do
    before do
      @rounds = 2
      @initial_health = 83
      @player = Player.new('bobby', @initial_health)
      @game.add_player(@player)
    end

    it 'blams player if the roll is low' do
      fake_roll(1)
      @game.play(@rounds)
      expect(@player.health).to eq(@initial_health - (10 * @rounds))
    end

    it 'w00ts player if the roll is high' do
      fake_roll(5)
      @game.play(@rounds)
      expect(@player.health).to eq(@initial_health + (15 * @rounds))
    end

    it 'does nothing when the rolls is medium' do
      fake_roll(3)
      @game.play(@rounds)
      expect(@player.health).to eq(@initial_health)
    end
  end
end
