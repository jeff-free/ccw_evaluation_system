require 'test_helper'

class PartyGroupsControllerTest < ActionController::TestCase
  setup do
    @party_group = party_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:party_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create party_group" do
    assert_difference('PartyGroup.count') do
      post :create, party_group: { name: @party_group.name }
    end

    assert_redirected_to party_group_path(assigns(:party_group))
  end

  test "should show party_group" do
    get :show, id: @party_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @party_group
    assert_response :success
  end

  test "should update party_group" do
    patch :update, id: @party_group, party_group: { name: @party_group.name }
    assert_redirected_to party_group_path(assigns(:party_group))
  end

  test "should destroy party_group" do
    assert_difference('PartyGroup.count', -1) do
      delete :destroy, id: @party_group
    end

    assert_redirected_to party_groups_path
  end
end
