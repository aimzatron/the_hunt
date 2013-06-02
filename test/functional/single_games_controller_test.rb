require 'test_helper'

class SingleGamesControllerTest < ActionController::TestCase
  setup do
    @single_game = single_games(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:single_games)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create single_game" do
    assert_difference('SingleGame.count') do
      post :create, single_game: { location: @single_game.location, player: @single_game.player }
    end

    assert_redirected_to single_game_path(assigns(:single_game))
  end

  test "should show single_game" do
    get :show, id: @single_game
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @single_game
    assert_response :success
  end

  test "should update single_game" do
    put :update, id: @single_game, single_game: { location: @single_game.location, player: @single_game.player }
    assert_redirected_to single_game_path(assigns(:single_game))
  end

  test "should destroy single_game" do
    assert_difference('SingleGame.count', -1) do
      delete :destroy, id: @single_game
    end

    assert_redirected_to single_games_path
  end
end
