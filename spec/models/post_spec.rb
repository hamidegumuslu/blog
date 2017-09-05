require "rails_helper"

RSpec.describe Post do
  it "title and body cant be blank" do
    post = Post.new
    post.title = "deneme"
    u = User.new
    u.email = 'deneme@yahoo.com'
    u.password = "123123123123deneme"
    u.save
    post.user = u
    expect(post).not_to be_valid
  end
  it "post has many comments" do
    c1 = Comment.new
    c1.content = "comment 1"
    c1.save
    c2 = Comment.new
    c1.content = "comment 2"
    c2.save
    post.comment = c1
    post.comment = c2

  end
end
