require 'test_helper'

class JoinSpaceCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @join_space_category = join_space_categories(:one)
  end

  test "should get index" do
    get join_space_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_join_space_category_url
    assert_response :success
  end

  test "should create join_space_category" do
    assert_difference('JoinSpaceCategory.count') do
      post join_space_categories_url, params: { join_space_category: {  } }
    end

    assert_redirected_to join_space_category_url(JoinSpaceCategory.last)
  end

  test "should show join_space_category" do
    get join_space_category_url(@join_space_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_join_space_category_url(@join_space_category)
    assert_response :success
  end

  test "should update join_space_category" do
    patch join_space_category_url(@join_space_category), params: { join_space_category: {  } }
    assert_redirected_to join_space_category_url(@join_space_category)
  end

  test "should destroy join_space_category" do
    assert_difference('JoinSpaceCategory.count', -1) do
      delete join_space_category_url(@join_space_category)
    end

    assert_redirected_to join_space_categories_url
  end
end
