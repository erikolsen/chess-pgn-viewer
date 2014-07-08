class WelcomePageController < ApplicationController
  def index
  end

  def show
  end

  def search
    @search = Game.search do
      fulltext params[:search]
    end
    @results = @search.results
    p params[:search]
    p @search
    p @results
    @test = "I am here"
  end

  def about
  end
end
