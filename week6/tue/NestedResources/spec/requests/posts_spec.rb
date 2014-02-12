require 'spec_helper'

describe "Posts" do
  describe "GET /posts" do
    it "should be successful" do
      get posts_path
      response.status.should == 200
    end

    it "should show the posts" do
      Post.create({ link: 'http://google.com', body: 'Google is cool'})
      Post.create({ link: 'http://generalassemb.ly', body: 'General Assembly is a place to learn'})
      get posts_path
      response.body.should include("http://google.com")
      response.body.should include("Google is cool")
      response.body.should include("http://generalassemb.ly")
      response.body.should include("General Assembly is a place to learn")
    end
  end

  describe "POST /posts" do
    before do
      post posts_path({ post: { link: 'http://google.com', body: 'Google is cool'} })
      follow_redirect!
    end
    it "should be successful" do
      response.status.should == 200
    end

    it "should show the post" do
      response.body.should include("http://google.com")
      response.body.should include("Google is cool")
    end
  end
end
