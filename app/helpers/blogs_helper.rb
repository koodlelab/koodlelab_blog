module BlogsHelper
  def populateMostRecentBlogs
    @recent_blogs = Blog.order("id desc").limit(5)
  end
end
