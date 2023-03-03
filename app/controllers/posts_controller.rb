class PostsController < ApplicationController
  def index
    @sous_category = SousCategory.find params[:sous_category_id]
    if params[:v].present?
       @posts = @sous_category.posts.where("name ILIKE ?", "%#{params[:v]}%")
      #  p success
    else
      @posts = @sous_category.posts
    end
  end

  def show
    @post = Post.find params[:id]

    # tableau de paragraphes avec leurs balise
    @content = @post.content_with_good_format
  end

   private

   def success
    {
      content: render_to_string(partial: "shared/question", format: :html, locals: { posts: @posts })
    }
   end

end








# ############ voir pk data.content n'arrrive pas
