# frozen_string_literal: true

require 'test_helper'

class LichessesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lichess = lichesses(:one)
  end

  test 'should get index' do
    get lichesses_url
    assert_response :success
  end

  test 'should get new' do
    get new_lichess_url
    assert_response :success
  end

  test 'should create lichess' do
    assert_difference('Lichess.count') do
      post lichesses_url,
           params: { lichess: { draw: @lichess.draw, loss: @lichess.loss, rank: @lichess.rank, student_id: @lichess.student_id, total_played: @lichess.total_played, username: @lichess.username,
                                win: @lichess.win } }
    end

    assert_redirected_to lichess_url(Lichess.last)
  end

  test 'should show lichess' do
    get lichess_url(@lichess)
    assert_response :success
  end

  test 'should get edit' do
    get edit_lichess_url(@lichess)
    assert_response :success
  end

  test 'should update lichess' do
    patch lichess_url(@lichess),
          params: { lichess: { draw: @lichess.draw, loss: @lichess.loss, rank: @lichess.rank, student_id: @lichess.student_id, total_played: @lichess.total_played, username: @lichess.username,
                               win: @lichess.win } }
    assert_redirected_to lichess_url(@lichess)
  end

  test 'should destroy lichess' do
    assert_difference('Lichess.count', -1) do
      delete lichess_url(@lichess)
    end

    assert_redirected_to lichesses_url
  end
end
