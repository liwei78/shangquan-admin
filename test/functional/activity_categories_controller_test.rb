require 'test_helper'

class ActivityCategoriesControllerTest < ActionController::TestCase
  setup do
    @activity_category = activity_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:activity_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create activity_category" do
    assert_difference('ActivityCategory.count') do
      post :create, activity_category: @activity_category.attributes
    end

    assert_redirected_to activity_category_path(assigns(:activity_category))
  end

  test "should show activity_category" do
    get :show, id: @activity_category.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @activity_category.to_param
    assert_response :success
  end

  test "should update activity_category" do
    put :update, id: @activity_category.to_param, activity_category: @activity_category.attributes
    assert_redirected_to activity_category_path(assigns(:activity_category))
  end

  test "should destroy activity_category" do
    assert_difference('ActivityCategory.count', -1) do
      delete :destroy, id: @activity_category.to_param
    end

    assert_redirected_to activity_categories_path
  end
end
