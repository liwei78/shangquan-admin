require 'test_helper'

class CompanyAreasControllerTest < ActionController::TestCase
  setup do
    @company_area = company_areas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:company_areas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company_area" do
    assert_difference('CompanyArea.count') do
      post :create, company_area: @company_area.attributes
    end

    assert_redirected_to company_area_path(assigns(:company_area))
  end

  test "should show company_area" do
    get :show, id: @company_area.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @company_area.to_param
    assert_response :success
  end

  test "should update company_area" do
    put :update, id: @company_area.to_param, company_area: @company_area.attributes
    assert_redirected_to company_area_path(assigns(:company_area))
  end

  test "should destroy company_area" do
    assert_difference('CompanyArea.count', -1) do
      delete :destroy, id: @company_area.to_param
    end

    assert_redirected_to company_areas_path
  end
end
