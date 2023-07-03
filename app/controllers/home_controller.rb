# app/controllers/home_controller.rb

class HomeController < ApplicationController
  def index
    @categories = Category.all
  end
end
