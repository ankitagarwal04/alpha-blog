require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
  test "get new category form and create it" do
    get new_category_path
    assert_template "categories/new"
    assert_difference "Category.count", 1 do
      post categories_path, params: {category: { name: "baseball" } }
      follow_redirect!
    end
    assert_template "categories/index"
    assert_match "baseball", response.body
  end

  test "invalid category submission results in faliure" do
    get new_category_path
    assert_template "categories/new"
    assert_no_difference "Category.count" do
      post categories_path, params: {category: { name: " " } }
    end
    assert_template "categories/new"
    assert_select "div.panel-title"
    assert_select "div.panel-body"
  end

end
