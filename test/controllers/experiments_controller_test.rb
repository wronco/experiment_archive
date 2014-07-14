require 'test_helper'

class ExperimentsControllerTest < ActionController::TestCase
  setup do
    @experiment = experiments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:experiments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create experiment" do
    assert_difference('Experiment.count') do
      post :create, experiment: { brief: @experiment.brief, confidence: @experiment.confidence, experiment_url: @experiment.experiment_url, hypothesis: @experiment.hypothesis, result_url: @experiment.result_url, screenshot_original: @experiment.screenshot_original, screenshot_variation: @experiment.screenshot_variation, user_id: @experiment.user_id, winner: @experiment.winner }
    end

    assert_redirected_to experiment_path(assigns(:experiment))
  end

  test "should show experiment" do
    get :show, id: @experiment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @experiment
    assert_response :success
  end

  test "should update experiment" do
    patch :update, id: @experiment, experiment: { brief: @experiment.brief, confidence: @experiment.confidence, experiment_url: @experiment.experiment_url, hypothesis: @experiment.hypothesis, result_url: @experiment.result_url, screenshot_original: @experiment.screenshot_original, screenshot_variation: @experiment.screenshot_variation, user_id: @experiment.user_id, winner: @experiment.winner }
    assert_redirected_to experiment_path(assigns(:experiment))
  end

  test "should destroy experiment" do
    assert_difference('Experiment.count', -1) do
      delete :destroy, id: @experiment
    end

    assert_redirected_to experiments_path
  end
end
