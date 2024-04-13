require "application_system_test_case"

class FirstPeopleTest < ApplicationSystemTestCase
  setup do
    @first_person = first_people(:one)
  end

  test "visiting the index" do
    visit first_people_url
    assert_selector "h1", text: "First people"
  end

  test "should create first person" do
    visit first_people_url
    click_on "New first person"

    check "Is base" if @first_person.is_base
    fill_in "Name", with: @first_person.name
    click_on "Create First person"

    assert_text "First person was successfully created"
    click_on "Back"
  end

  test "should update First person" do
    visit first_person_url(@first_person)
    click_on "Edit this first person", match: :first

    check "Is base" if @first_person.is_base
    fill_in "Name", with: @first_person.name
    click_on "Update First person"

    assert_text "First person was successfully updated"
    click_on "Back"
  end

  test "should destroy First person" do
    visit first_person_url(@first_person)
    click_on "Destroy this first person", match: :first

    assert_text "First person was successfully destroyed"
  end
end
