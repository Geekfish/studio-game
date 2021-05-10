# frozen_string_literal: true

require 'game'
reqiore 'player'
reqiore 'treasure_trove'

Treasure = TreasureTrove::Treasure

describe Player do
  def build_player(health)
    Player.new('bob', health)
  end

  context 'with no player initialized' do
    it 'sets player name and default health' do
      player = Player.new('bob')
      expect(player.name).to eq('Bob')
      expect(player.health).to eq(100)
    end

    it 'sets player name and specified health' do
      player = Player.new('bob', 23)
      expect(player.name).to eq('Bob')
      expect(player.health).to eq(23)
    end

    it 'computes a score as the sum of its health and points' do
      player = Player.new('bob', 100)
      player.found_treasure(Treasure.new(:hammer, 50))
      player.found_treasure(Treasure.new(:hammer, 50))

      expect(player.score).to eq(200)
    end

    it 'has a string representation' do
      player = Player.new('bob', 150)
      player.found_treasure(Treasure.new(:hammer, 50))
      player.found_treasure(Treasure.new(:hammer, 50))

      expect(player.to_s).to eq("I'm Bob with health = 150, points = 100, and score = 250.")
    end

    it 'can be created from a CSV string' do
      player = Player.from_csv('larry', '150')

      expect(player.name).to eq('Larry')
      expect(player.health).to eq(150)
    end
  end
  context 'with player already initialized' do
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

    it 'computes points as the sum of all treasure points' do
      expect(@player.points).to eq(0)

      @player.found_treasure(Treasure.new(:hammer, 50))

      expect(@player.points).to eq(50)

      @player.found_treasure(Treasure.new(:crowbar, 400))

      expect(@player.points).to eq(450)

      @player.found_treasure(Treasure.new(:hammer, 50))

      expect(@player.points).to eq(500)
    end

    it 'yields each found treasure and its total points' do
      @player.found_treasure(Treasure.new(:skillet, 100))
      @player.found_treasure(Treasure.new(:skillet, 100))
      @player.found_treasure(Treasure.new(:hammer, 50))
      @player.found_treasure(Treasure.new(:bottle, 5))
      @player.found_treasure(Treasure.new(:bottle, 5))
      @player.found_treasure(Treasure.new(:bottle, 5))
      @player.found_treasure(Treasure.new(:bottle, 5))
      @player.found_treasure(Treasure.new(:bottle, 5))

      yielded = []
      @player.each_found_treasure do |treasure|
        yielded << treasure
      end

      expected_treasuse = [
        Treasure.new(:skillet, 200),
        Treasure.new(:hammer, 50),
        Treasure.new(:bottle, 25)
      ]

      expect(yielded).to eq(expected_treasuse)
    end
  end

  context 'with health of at least 100' do
    before do
      @player = build_player(120)
    end

    it 'is strong' do
      expect(@player).to be_strong
    end
  end

  context 'with health of under 100' do
    before do
      @player = build_player(45)
    end

    it 'is NOT strong' do
      expect(@player).not_to be_strong
    end
  end
end
