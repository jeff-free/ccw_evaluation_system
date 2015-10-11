require 'test_helper'

class InterpellationsControllerTest < ActionController::TestCase
  setup do
    @interpellation = interpellations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:interpellations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create interpellation" do
    assert_difference('Interpellation.count') do
      post :create, interpellation: { committee_id: @interpellation.committee_id, content: @interpellation.content, evaluation_id: @interpellation.evaluation_id, interpellation_date: @interpellation.interpellation_date, name: @interpellation.name }
    end

    assert_redirected_to interpellation_path(assigns(:interpellation))
  end

  test "should show interpellation" do
    get :show, id: @interpellation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @interpellation
    assert_response :success
  end

  test "should update interpellation" do
    patch :update, id: @interpellation, interpellation: { committee_id: @interpellation.committee_id, content: @interpellation.content, evaluation_id: @interpellation.evaluation_id, interpellation_date: @interpellation.interpellation_date, name: @interpellation.name }
    assert_redirected_to interpellation_path(assigns(:interpellation))
  end

  test "should destroy interpellation" do
    assert_difference('Interpellation.count', -1) do
      delete :destroy, id: @interpellation
    end

    assert_redirected_to interpellations_path
  end
end
