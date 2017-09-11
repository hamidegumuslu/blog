require "rails_helper"

RSpec.describe Post, :type => :model do
  describe "Validations" do
    it "title and body cant be blank" do
      post = Post.new
      u = FactoryGirl.build(:user)
      post.user = u
      expect(post).not_to be_valid
    end
  end
  describe "Associations" do
    it "post has many comments" do
      post = Post.reflect_on_association(:comments)
      expect(post.macro)==:has_many
    end
    it "post belongs to user" do
      post_user = Post.reflect_on_association(:user)
      expect(post_user.macro).to eq(:belongs_to)
    end
    it "post has many categories and belongs to category" do
      post_category = Post.reflect_on_association(:categories)
      expect(post_category.macro).to eq(:has_and_belongs_to_many)
    end
  end
end
