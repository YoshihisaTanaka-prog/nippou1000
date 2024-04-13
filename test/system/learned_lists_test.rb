require "application_system_test_case"

class LearnedListsTest < ApplicationSystemTestCase
  setup do
    @learned_list = learned_lists(:one)
  end

  test "visiting the index" do
    visit learned_lists_url
    assert_selector "h1", text: "Learned lists"
  end

  test "should create learned list" do
    visit learned_lists_url
    click_on "New learned list"

    check "Is learned" if @learned_list.is_learned
    fill_in "Text", with: @learned_list.text
    click_on "Create Learned list"

    assert_text "Learned list was successfully created"
    click_on "Back"
  end

  test "should update Learned list" do
    visit learned_list_url(@learned_list)
    click_on "Edit this learned list", match: :first

    check "Is learned" if @learned_list.is_learned
    fill_in "Text", with: @learned_list.text
    click_on "Update Learned list"

    assert_text "Learned list was successfully updated"
    click_on "Back"
  end

  test "should destroy Learned list" do
    visit learned_list_url(@learned_list)
    click_on "Destroy this learned list", match: :first

    assert_text "Learned list was successfully destroyed"
  end
end
