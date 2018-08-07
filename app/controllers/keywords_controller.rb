class KeywordsController < ApplicationController
  def index
  end

  def new
    @keyword = Keyword.new
  end

  def create
  end

  def edit
  end

  def update
  end

  private
    def keyword_params
      params.require(:keyword).permit(:name)
    end
end
