require "application_system_test_case"

class PointsTest < ApplicationSystemTestCase
  setup do
    @point = points(:one)
  end

  test "visiting the index" do
    visit points_url
    assert_selector "h1", text: "Points"
  end

  test "should create point" do
    visit points_url
    click_on "New point"

    check "Is good" if @point.is_good
    fill_in "Text", with: @point.text
    click_on "Create Point"

    assert_text "Point was successfully created"
    click_on "Back"
  end

  test "should update Point" do
    visit point_url(@point)
    click_on "Edit this point", match: :first

    check "Is good" if @point.is_good
    fill_in "Text", with: @point.text
    click_on "Update Point"

    assert_text "Point was successfully updated"
    click_on "Back"
  end

  test "should destroy Point" do
    visit point_url(@point)
    click_on "Destroy this point", match: :first

    assert_text "Point was successfully destroyed"
  end
end
