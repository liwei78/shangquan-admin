require 'test_helper'

class ActivityAreasControllerTest < ActionController::TestCase
  setup do
    @activity_area = activity_areas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:activity_areas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create activity_area" do
    assert_difference('ActivityArea.count') do
      post :create, activity_area: @activity_area.attributes
    end

    assert_redirected_to activity_area_path(assigns(:activity_area))
  end

  test "should show activity_area" do
    get :show, id: @activity_area.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @activity_area.to_param
    assert_response :success
  end

  test "should update activity_area" do
    put :update, id: @activity_area.to_param, activity_area: @activity_area.attributes
    assert_redirected_to activity_area_path(assigns(:activity_area))
  end

  test "should destroy activity_area" do
    assert_difference('ActivityArea.count', -1) do
      delete :destroy, id: @activity_area.to_param
    end

    assert_redirected_to activity_areas_path
  end
end
