require 'test_helper'

class TodoesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get todoes_index_url
    assert_response :success
  end

  test "should get show" do
    get todoes_show_url
    assert_response :success
  end

  test "should get new" do
    get todoes_new_url
    assert_response :success
  end

  test "should get edit" do
    get todoes_edit_url
    assert_response :success
  end

end
