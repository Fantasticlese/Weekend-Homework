class PagesController < ApplicationController
  def home
  end

  def authors
  	@authors = Blog.all
  end

  def titles
  	@titles = Blog.all
  end
end
