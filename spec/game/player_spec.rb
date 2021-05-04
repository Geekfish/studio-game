require 'game'
require 'game/player'

describe Game::Player do
  before do
    $stdout = StringIO.new
  end

  context 'with no player initialized' do
    it 'sets player name and default health' do
      player = Game::Player.new('bob')
      expect(player.name).to eq('Bob')
      expect(player.health).to eq(100)
    end

    it 'sets player name and specified health' do
      player = Game::Player.new('bob', 23)
      expect(player.name).to eq('Bob')
      expect(player.health).to eq(23)
    end
  end
  context 'with player already initialized' do
    def build_player(health)
      Game::Player.new('bob', health)
    end

    before do
      @initial_health = 120
      @player = build_player(@initial_health)
    end

    it 'reduces health when blammed' do
      @player.blam
      expect(@player.health).to eq(@initial_health - 10)
    end

    it 'replenishes health when w00ted' do
      @player.w00t
      expect(@player.health).to eq(@initial_health + 15)
    end
  end
end
