class SiteThemesController < ApplicationController
  before_action :prepare_data, :only => [:index, :filter, :search]

  def index
    @site_themes = SiteTheme.all.page(params[:page]).per(Setting.site_themes.max_page)
  end

  def filter
    param_tag = params[:tags].split(",")
    tag_arr = param_tag-["all"]
    @page_title = ""
    unless tag_arr.blank?
      tags = ThemeTag.find(tag_arr)
      ship = ThemeTagship.where(:theme_tag_id => tags).group("site_theme_id").having("count(theme_tag_id) = #{tags.size}")
      ids = []
      ship.each do |s|
        ids << s.site_theme_id
      end
      @site_themes = SiteTheme.where(:id => ids).page(params[:page]).per(Setting.site_themes.max_page)
      tags.each do |tag|
        @page_title += tag.name + "_"
      end
      gon.tags = param_tag
    else
      redirect_to site_themes_url
    end
  end

  def search
    if params[:search].present?
      @site_themes = SiteTheme.search params[:search], page: params[:page], per_page: Setting.site_themes.max_page
      @page_title = params[:search] + "_"
      gon.search = params[:search]
    else
      redirect_to site_themes_url
    end
  end

  def show
    @site_theme = SiteTheme.find(params[:id])
  end

  private
    def prepare_data
      @categories = Category.where(:name => ['行业', '风格', '颜色'])
      gon.tags = []
    end
end
