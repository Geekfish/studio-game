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

    it 'computes total points as the sum of all player points' do
      game = Game.new('Knuckleheads')

      player1 = Player.new('moe')
      player2 = Player.new('larry')

      game.add_player(player1)
      game.add_player(player2)

      player1.found_treasure(Treasure.new(:hammer, 50))
      player1.found_treasure(Treasure.new(:hammer, 50))
      player2.found_treasure(Treasure.new(:crowbar, 400))

      expect(game.total_points).to eq(500)
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

    it "assigns a treasure for points during the player's turn" do
      @game.play(1)
      expect(@player.points).not_to be_zero
    end
  end
end
