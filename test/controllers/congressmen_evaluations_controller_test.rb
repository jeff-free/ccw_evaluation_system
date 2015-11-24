require 'test_helper'

class CongressmenEvaluationsControllerTest < ActionController::TestCase
  setup do
    @congressmen_evaluation = congressmen_evaluations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:congressmen_evaluations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create congressmen_evaluation" do
    assert_difference('CongressmenEvaluation.count') do
      post :create, congressmen_evaluation: { election_type: @congressmen_evaluation.election_type, evaluation,: @congressmen_evaluation.evaluation,, party,: @congressmen_evaluation.party, }
    end

    assert_redirected_to congressmen_evaluation_path(assigns(:congressmen_evaluation))
  end

  test "should show congressmen_evaluation" do
    get :show, id: @congressmen_evaluation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @congressmen_evaluation
    assert_response :success
  end

  test "should update congressmen_evaluation" do
    patch :update, id: @congressmen_evaluation, congressmen_evaluation: { election_type: @congressmen_evaluation.election_type, evaluation,: @congressmen_evaluation.evaluation,, party,: @congressmen_evaluation.party, }
    assert_redirected_to congressmen_evaluation_path(assigns(:congressmen_evaluation))
  end

  test "should destroy congressmen_evaluation" do
    assert_difference('CongressmenEvaluation.count', -1) do
      delete :destroy, id: @congressmen_evaluation
    end

    assert_redirected_to congressmen_evaluations_path
  end
end
