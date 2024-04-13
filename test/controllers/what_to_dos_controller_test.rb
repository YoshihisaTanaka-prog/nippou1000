require "test_helper"

class WhatToDosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @what_to_do = what_to_dos(:one)
  end

  test "should get index" do
    get what_to_dos_url
    assert_response :success
  end

  test "should get new" do
    get new_what_to_do_url
    assert_response :success
  end

  test "should create what_to_do" do
    assert_difference("WhatToDo.count") do
      post what_to_dos_url, params: { what_to_do: { name: @what_to_do.name, time: @what_to_do.time } }
    end

    assert_redirected_to what_to_do_url(WhatToDo.last)
  end

  test "should show what_to_do" do
    get what_to_do_url(@what_to_do)
    assert_response :success
  end

  test "should get edit" do
    get edit_what_to_do_url(@what_to_do)
    assert_response :success
  end

  test "should update what_to_do" do
    patch what_to_do_url(@what_to_do), params: { what_to_do: { name: @what_to_do.name, time: @what_to_do.time } }
    assert_redirected_to what_to_do_url(@what_to_do)
  end

  test "should destroy what_to_do" do
    assert_difference("WhatToDo.count", -1) do
      delete what_to_do_url(@what_to_do)
    end

    assert_redirected_to what_to_dos_url
  end
end
