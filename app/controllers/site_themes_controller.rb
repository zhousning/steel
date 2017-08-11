class SiteThemesController < ApplicationController
  def index
    @site_themes = SiteTheme.page(params[:page]).per(15) 
  end

  def show
    @site_theme = SiteTheme.find(params[:id])
  end
end
