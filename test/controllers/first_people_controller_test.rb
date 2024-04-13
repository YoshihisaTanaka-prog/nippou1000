require "test_helper"

class FirstPeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @first_person = first_people(:one)
  end

  test "should get index" do
    get first_people_url
    assert_response :success
  end

  test "should get new" do
    get new_first_person_url
    assert_response :success
  end

  test "should create first_person" do
    assert_difference("FirstPerson.count") do
      post first_people_url, params: { first_person: { is_base: @first_person.is_base, name: @first_person.name } }
    end

    assert_redirected_to first_person_url(FirstPerson.last)
  end

  test "should show first_person" do
    get first_person_url(@first_person)
    assert_response :success
  end

  test "should get edit" do
    get edit_first_person_url(@first_person)
    assert_response :success
  end

  test "should update first_person" do
    patch first_person_url(@first_person), params: { first_person: { is_base: @first_person.is_base, name: @first_person.name } }
    assert_redirected_to first_person_url(@first_person)
  end

  test "should destroy first_person" do
    assert_difference("FirstPerson.count", -1) do
      delete first_person_url(@first_person)
    end

    assert_redirected_to first_people_url
  end
end
