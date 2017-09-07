class SiteThemesController < ApplicationController
  def index
    @categories = Category.all
    if params[:search]
      param_tag = params[:search].split(",")
      tag_arr = param_tag-["all"]
      unless tag_arr.blank?
        tags = ThemeTag.find(tag_arr)
        ship = ThemeTagship.where(:theme_tag_id => tags).group("site_theme_id").having("count(theme_tag_id) = #{tags.size}")
        ids = []
        ship.each do |s|
          ids << s.site_theme_id
        end
        @site_themes = SiteTheme.where(:id => ids).page(params[:page]).per(15)
        gon.tags = param_tag
      else
        @site_themes = SiteTheme.all.page(params[:page]).per(15)
        gon.tags = []
      end
    else
      @site_themes = SiteTheme.all.page(params[:page]).per(15)
      gon.tags = []
    end
  end

  def search
    tags = ThemeTag.search params[:tags], fields: [{name: :exact}]
    @site_themes = tags.sitethemes
    gon.tags = []
    redirect_to site_themes_path
  end

  def show
    @site_theme = SiteTheme.find(params[:id])
  end
end
