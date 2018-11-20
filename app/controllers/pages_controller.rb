class PagesController < ApplicationController
#CRUD

#read , views all the pages
  def index
    # sql select * from pages
    @pages = Page.all
  end

#read , views a single page
  def show
    #sql 
    @page = Page.find(params[:id])
  end

#read, renders the form for a new page
  def new
    #creates a new page only in memory
    @page = Page.new
    #renders the form 
  end

#create, creates a new page 
  def create
    @page = Page.new(pages_params)

    if @pages.save
      redirect_to pages_path
    else
      render :new
    end 
  end 

#read, renders the edit form 
  def edit
    @page = Page.find(params[:id])
    #render the edit form 
  end 

#update, updates the page
  def update
    #looking for a page a specific id 
    @page = Page.find(params[:id])
    #updates with new information
      if @page.update([pages_params])
          redirect_to pages_path 
      else
        render :edit
      end 
  end   

#delete, delete a single page
  def destroy
    #find and delete a page 
    Page.find(params[:id]).destroy

    #take us back to all pages
    redirect_to pages_path 
  end 

  private 
    
    def pages_params
      params.require(:page).permit(:title, :body)
    end 
end
