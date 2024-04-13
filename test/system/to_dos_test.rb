require "application_system_test_case"

class ToDosTest < ApplicationSystemTestCase
  setup do
    @to_do = to_dos(:one)
  end

  test "visiting the index" do
    visit to_dos_url
    assert_selector "h1", text: "To dos"
  end

  test "should create to do" do
    visit to_dos_url
    click_on "New to do"

    check "Is finished" if @to_do.is_finished
    fill_in "Name", with: @to_do.name
    fill_in "Time limit", with: @to_do.time_limit
    click_on "Create To do"

    assert_text "To do was successfully created"
    click_on "Back"
  end

  test "should update To do" do
    visit to_do_url(@to_do)
    click_on "Edit this to do", match: :first

    check "Is finished" if @to_do.is_finished
    fill_in "Name", with: @to_do.name
    fill_in "Time limit", with: @to_do.time_limit
    click_on "Update To do"

    assert_text "To do was successfully updated"
    click_on "Back"
  end

  test "should destroy To do" do
    visit to_do_url(@to_do)
    click_on "Destroy this to do", match: :first

    assert_text "To do was successfully destroyed"
  end
end
