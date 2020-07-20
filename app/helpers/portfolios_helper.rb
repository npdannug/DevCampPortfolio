module PortfoliosHelper
  def image_generator(height:, width:)
  	"https://via.placeholder.com/#{height}x#{width}"
  end

  def portfolio_item_img item, type
  	if type == 'thumb'
  	  item.thumb_image.url || image_generator(height: '350', width: '200')
  	else
  	  item.main_image.url || image_generator(height: '600', width: '400')
  	end
  end

end
