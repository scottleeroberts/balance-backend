require 'test_helper'

class GameTest < ActiveSupport::TestCase
  test 'should not save game without name, url, and category' do
    game = Game.new
    assert_not game.save, 'Saved the game without a name, url, and category'
  end

  test 'should not save game with invalid url format' do
    game = games(:one).dup
    game.url = 'invalid_url'
    assert_not game.save, 'Saved the game with an invalid url format'
  end

  test 'should save valid game' do
    game = Game.new(name: 'Test Game', url: 'https://example.com', category: :math)
    assert game.save, 'Failed to save the valid game'
  end

  test 'should filter math games' do
    assert_equal 2, Game.math_games.count
  end

  test 'should filter reading games' do
    assert_equal 0, Game.reading_games.count
  end

  test 'should filter speaking games' do
    assert_equal 0, Game.speaking_games.count
  end

  test 'should filter writing games' do
    assert_equal 0, Game.writing_games.count
  end
end
