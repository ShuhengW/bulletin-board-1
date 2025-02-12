class HomepageController < ApplicationController
  def index
    @boards = Board.all
    render({ :template => "homepage/index" })
  end
end
