require 'test_helper'

class HerdsControllerTest < ActionController::TestCase
  setup do
    @herd = herds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:herds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create herd" do
    assert_difference('Herd.count') do
      post :create, :herd => @herd.attributes
    end

    assert_redirected_to herd_path(assigns(:herd))
  end

  test "should show herd" do
    get :show, :id => @herd.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @herd.to_param
    assert_response :success
  end

  test "should update herd" do
    put :update, :id => @herd.to_param, :herd => @herd.attributes
    assert_redirected_to herd_path(assigns(:herd))
  end

  test "should destroy herd" do
    assert_difference('Herd.count', -1) do
      delete :destroy, :id => @herd.to_param
    end

    assert_redirected_to herds_path
  end
end
