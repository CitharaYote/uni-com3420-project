class MainController < ApplicationController

  def home
    @filtered_data = []
    @search = ""
  end

end