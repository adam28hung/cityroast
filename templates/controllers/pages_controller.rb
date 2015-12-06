class PagesController < ApplicationController
  include HighVoltage::StaticPage

  layout :layout_for_page

  def show
    set_meta_tags title: params[:id]
    super
  end
  
  private

  def layout_for_page
    case params[:id]
    when 'home'
      'home'
    else
      'application'
    end
  end
end
