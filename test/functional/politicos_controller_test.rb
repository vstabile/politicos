require 'test_helper'

class PoliticosControllerTest < ActionController::TestCase
  setup do
    @politico = politicos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:politicos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create politico" do
    assert_difference('Politico.count') do
      post :create, politico: @politico.attributes
    end

    assert_redirected_to politico_path(assigns(:politico))
  end

  test "should show politico" do
    get :show, id: @politico
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @politico
    assert_response :success
  end

  test "should update politico" do
    put :update, id: @politico, politico: @politico.attributes
    assert_redirected_to politico_path(assigns(:politico))
  end

  test "should destroy politico" do
    assert_difference('Politico.count', -1) do
      delete :destroy, id: @politico
    end

    assert_redirected_to politicos_path
  end
end
