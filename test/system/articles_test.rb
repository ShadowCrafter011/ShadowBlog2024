require "application_system_test_case"

class ArticlesTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  # setup do
  #   @article = articles(:one)
  # end

  # test "visiting the index" do
  #   visit articles_url
  #   assert_selector "h1", text: "ShadowBlog"
  # end

  # test "should create article" do
  #   sign_in users(:one)

  #   visit articles_url
  #   click_on "New article"

  #   fill_in_rich_text_area "Body", with: @article.body
  #   fill_in "Title", with: @article.title
  #   click_on "Create Article"

  #   assert_text "Article was successfully created"
  #   click_on "View all articles"
  # end

  # test "should update Article" do
  #   sign_in users(:one)

  #   visit article_url(@article)
  #   click_on "Edit this article", match: :first

  #   find("trix-editor", wait: 5)
  #   fill_in_rich_text_area "Body", with: @article.body
  #   fill_in "Title", with: @article.title
  #   click_on "Update Article"

  #   assert_text "Article was successfully updated", wait: 5
  #   click_on "View all articles"
  # end

  # test "should destroy Article" do
  #   sign_in users(:one)

  #   visit article_url(@article)
  #   click_on "Destroy this article", match: :first

  #   page.accept_alert

  #   assert_text "Article was successfully destroyed"
  # end
end
