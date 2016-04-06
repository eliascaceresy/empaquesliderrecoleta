require 'test_helper'

class TomaturnosControllerTest < ActionController::TestCase
  setup do
    @tomaturno = tomaturnos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tomaturnos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tomaturno" do
    assert_difference('Tomaturno.count') do
      post :create, tomaturno: { state: @tomaturno.state }
    end

    assert_redirected_to tomaturno_path(assigns(:tomaturno))
  end

  test "should show tomaturno" do
    get :show, id: @tomaturno
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tomaturno
    assert_response :success
  end

  test "should update tomaturno" do
    patch :update, id: @tomaturno, tomaturno: { state: @tomaturno.state }
    assert_redirected_to tomaturno_path(assigns(:tomaturno))
  end

  test "should destroy tomaturno" do
    assert_difference('Tomaturno.count', -1) do
      delete :destroy, id: @tomaturno
    end

    assert_redirected_to tomaturnos_path
  end
end
