require "test_helper"

class LearnedListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @learned_list = learned_lists(:one)
  end

  test "should get index" do
    get learned_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_learned_list_url
    assert_response :success
  end

  test "should create learned_list" do
    assert_difference("LearnedList.count") do
      post learned_lists_url, params: { learned_list: { is_learned: @learned_list.is_learned, text: @learned_list.text } }
    end

    assert_redirected_to learned_list_url(LearnedList.last)
  end

  test "should show learned_list" do
    get learned_list_url(@learned_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_learned_list_url(@learned_list)
    assert_response :success
  end

  test "should update learned_list" do
    patch learned_list_url(@learned_list), params: { learned_list: { is_learned: @learned_list.is_learned, text: @learned_list.text } }
    assert_redirected_to learned_list_url(@learned_list)
  end

  test "should destroy learned_list" do
    assert_difference("LearnedList.count", -1) do
      delete learned_list_url(@learned_list)
    end

    assert_redirected_to learned_lists_url
  end
end
