require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @article = articles(:one)
  end

  test "should get index" do
    get articles_url
    assert_response :success
  end

  test "should redirect to login page when logged out" do
    get new_article_url
    assert_response :redirect
  end

  test "should disallow non authorized user" do
    sign_in users(:two)

    get new_article_url
    assert_response :redirect
  end

  test "should get new" do
    sign_in users(:one)

    get new_article_url
    assert_response :success
  end

  test "should prevent disallowed article creation" do
    sign_in users(:two)

    assert_no_changes("Article.count") do
      post articles_url, params: { article: { body: @article.body, title: @article.title, user_id: @article.user_id } }
      assert_response :redirect
    end
  end

  test "should create article" do
    sign_in users(:one)

    assert_difference("Article.count") do
      post articles_url, params: { article: { body: @article.body, title: @article.title, user_id: @article.user_id } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should show article" do
    get article_url(@article)
    assert_response :success
  end

  test "should not get disallowed edit" do
    sign_in users(:two)

    get edit_article_url(@article)
    assert_response :redirect
  end

  test "should get edit" do
    sign_in users(:one)

    get edit_article_url(@article)
    assert_response :success
  end

  test "should update article" do
    sign_in users(:one)

    patch article_url(@article), params: { article: { body: @article.body, title: @article.title, user_id: @article.user_id } }
    assert_redirected_to article_url(@article)
  end

  test "should prevent disallowed article destruction" do
    sign_in users(:two)

    assert_no_changes("Article.count") do
      delete article_url(@article)
    end
  end

  test "should destroy article" do
    sign_in users(:one)

    assert_difference("Article.count", -1) do
      delete article_url(@article)
    end

    assert_redirected_to articles_url
  end
end
