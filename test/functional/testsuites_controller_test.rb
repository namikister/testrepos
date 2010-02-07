require 'test_helper'

class TestsuitesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:testsuites)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create testsuite" do
    assert_difference('Testsuite.count') do
      post :create, :testsuite => { }
    end

    assert_redirected_to testsuite_path(assigns(:testsuite))
  end

  test "should show testsuite" do
    get :show, :id => testsuites(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => testsuites(:one).to_param
    assert_response :success
  end

  test "should update testsuite" do
    put :update, :id => testsuites(:one).to_param, :testsuite => { }
    assert_redirected_to testsuite_path(assigns(:testsuite))
  end

  test "should destroy testsuite" do
    assert_difference('Testsuite.count', -1) do
      delete :destroy, :id => testsuites(:one).to_param
    end

    assert_redirected_to testsuites_path
  end
end
