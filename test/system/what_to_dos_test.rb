require "application_system_test_case"

class WhatToDosTest < ApplicationSystemTestCase
  setup do
    @what_to_do = what_to_dos(:one)
  end

  test "visiting the index" do
    visit what_to_dos_url
    assert_selector "h1", text: "What to dos"
  end

  test "should create what to do" do
    visit what_to_dos_url
    click_on "New what to do"

    fill_in "Name", with: @what_to_do.name
    fill_in "Time", with: @what_to_do.time
    click_on "Create What to do"

    assert_text "What to do was successfully created"
    click_on "Back"
  end

  test "should update What to do" do
    visit what_to_do_url(@what_to_do)
    click_on "Edit this what to do", match: :first

    fill_in "Name", with: @what_to_do.name
    fill_in "Time", with: @what_to_do.time
    click_on "Update What to do"

    assert_text "What to do was successfully updated"
    click_on "Back"
  end

  test "should destroy What to do" do
    visit what_to_do_url(@what_to_do)
    click_on "Destroy this what to do", match: :first

    assert_text "What to do was successfully destroyed"
  end
end
