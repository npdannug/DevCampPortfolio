class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :update, :show, :destroy, :move]
  layout "portfolio"
  access all: [:show, :index, :angular], 
        user: {except: [:destroy, :new, :create, :update, :edit, :move]}, 
        site_admin: :all

  def index
  	@portfolio_items = Portfolio.by_postion
  end

  def angular
    @angular_portfolio_items = Portfolio.angular
  end
 
  def show
  end 
 
  def new
  	@portfolio_item = Portfolio.new
    
  end

  def create
  	@portfolio_item = Portfolio.new(portfolio_params)

  	respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio item was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit  	
    
  end

  def update
  	
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolio_path(@portfolio_item), notice: 'Portfolio item was successfully updated.' }    
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
  	
  	@portfolio_item.destroy
  	respond_to do |format|
      format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully deleted.' }
    end
  end

  def move
    @portfolio_item.insert_at(params[:position].to_i) 
  end

  private
    def portfolio_params
      params.require(:portfolio).permit(:title, 
                                        :subtitle, 
                                        :body, 
                                        :main_image,
                                        :thumb_image,
                                        technologies_attributes: [:id, :name, :_destroy]
                                       )
    end

    def set_portfolio_item
      @portfolio_item = Portfolio.friendly.find(params[:id]) 
    end
   
end
