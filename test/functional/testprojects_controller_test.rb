require 'test_helper'

class TestprojectsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:testprojects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create testproject" do
    assert_difference('Testproject.count') do
      post :create, :testproject => { }
    end

    assert_redirected_to testproject_path(assigns(:testproject))
  end

  test "should show testproject" do
    get :show, :id => testprojects(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => testprojects(:one).to_param
    assert_response :success
  end

  test "should update testproject" do
    put :update, :id => testprojects(:one).to_param, :testproject => { }
    assert_redirected_to testproject_path(assigns(:testproject))
  end

  test "should destroy testproject" do
    assert_difference('Testproject.count', -1) do
      delete :destroy, :id => testprojects(:one).to_param
    end

    assert_redirected_to testprojects_path
  end
end
