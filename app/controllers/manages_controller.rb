class ManagesController < ApplicationController
  before_filter :authenticate_user! 
  before_filter :authenticate_role

  def index
  end
end
