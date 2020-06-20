module DefaultPageContentConcern
  extend ActiveSupport::Concern
  
  included do 
    before_action :set_page_defaults
  end

  def set_page_defaults
  	@page_title = "DevCamp Portfolio | Norman Paul Dannug"
  	@seo_keywords = "Norman Paul Dannug portfolio"
  end

end