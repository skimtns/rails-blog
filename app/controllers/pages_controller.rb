class PagesController < ApplicationController
  def index
    # sql select * from pages
    @pages = Page.all
  end

  def show
    #sql 
    @page = Page.find(params[:id])
  end

  def new
    #creates a new page only in memory
    @page = Page.new
    #renders the form 
  end

  def create
    @page = Page.new(pages_params)

    if @pages.save
      redirect_to pages_path
    else
      render :new
    end 
  end 

  private 
    
    def pages_params
      params.require(:page).permit(:title, :body)
    end 
end
