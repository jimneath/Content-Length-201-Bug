require 'test_helper'

class ApplesControllerTest < ActionController::TestCase
  setup do
    @apple = apples(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:apples)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create apple" do
    assert_difference('Apple.count') do
      post :create, :apple => @apple.attributes
    end

    assert_redirected_to apple_path(assigns(:apple))
  end

  test "should show apple" do
    get :show, :id => @apple.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @apple.to_param
    assert_response :success
  end

  test "should update apple" do
    put :update, :id => @apple.to_param, :apple => @apple.attributes
    assert_redirected_to apple_path(assigns(:apple))
  end

  test "should destroy apple" do
    assert_difference('Apple.count', -1) do
      delete :destroy, :id => @apple.to_param
    end

    assert_redirected_to apples_path
  end
end
