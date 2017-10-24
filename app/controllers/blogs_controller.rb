class BlogsController < ApplicationController

  def index
  	@blogs = Blog.all
  end

  def new
  	@blogs = Blog.new
  end


  def create
    @blog = Blog.new(params.require(:blog).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Yay! You made a blog.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
   @blogs = Blog.find(params[:id])
  end

    def update
   	  @blogs = Blog.find(params[:id])

      respond_to do |format|
        if @blog.update(params.require(:blog).permit(:title, :author, :body))
          format.html { redirect_to @blogs, notice: 'Blog was successfully updated.' }

        else
          format.html { render :edit }
        end
      end
    end

    def show
    	@blogs = Blog.find(params[:id])
    end

    def destroy
      # Perform the lookup
      @blog_item = Blog.find(params[:id])

      # Destroy/delete the record
      @blog_item.destroy

      # Redirect
      respond_to do |format|
        format.html { redirect_to blogs_url, notice: 'Record was removed.' }
      end
    end

end
