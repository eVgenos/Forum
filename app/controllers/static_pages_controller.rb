class StaticPagesController < ApplicationController
  def home
    @last_categories = Category.published.limit(3)
    @categoires = Category.published
    @users = User.notdeleted
    @messages = Message.all
  end
end
