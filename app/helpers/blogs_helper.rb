module BlogsHelper
  def populateMostRecentBlogs
    @recent_blogs = Blog.order("created_at desc").limit(5)
  end

end
