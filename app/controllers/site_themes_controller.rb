class SiteThemesController < ApplicationController
  def index
    if params[:search]
      param_tag = params[:search].split(",")
      tag_arr = param_tag-["all"]
      unless tag_arr.blank?
        tags = ProjectTag.where(:name => tag_arr)
        ship = ThemeTagship.where(:project_tag_id => tags).group("site_theme_id").having("count(project_tag_id) = #{tags.size}")
        ids = []
        ship.each do |s|
          ids << s.site_theme_id
        end
        @site_themes = SiteTheme.where(:id => ids).page(params[:page]).per(15)
      else
        @site_themes = SiteTheme.all.page(params[:page]).per(15)
      end
      gon.tags = param_tag
    else
      @site_themes = SiteTheme.all.page(params[:page]).per(15)
      gon.tags = ["all", "all", "all"]
    end
  end

  def show
    @site_theme = SiteTheme.find(params[:id])
  end
end
