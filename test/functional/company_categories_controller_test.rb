require 'test_helper'

class CompanyCategoriesControllerTest < ActionController::TestCase
  setup do
    @company_category = company_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:company_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company_category" do
    assert_difference('CompanyCategory.count') do
      post :create, company_category: @company_category.attributes
    end

    assert_redirected_to company_category_path(assigns(:company_category))
  end

  test "should show company_category" do
    get :show, id: @company_category.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @company_category.to_param
    assert_response :success
  end

  test "should update company_category" do
    put :update, id: @company_category.to_param, company_category: @company_category.attributes
    assert_redirected_to company_category_path(assigns(:company_category))
  end

  test "should destroy company_category" do
    assert_difference('CompanyCategory.count', -1) do
      delete :destroy, id: @company_category.to_param
    end

    assert_redirected_to company_categories_path
  end
end
