class ChangeBodyTypeInBlogs < ActiveRecord::Migration
  def change
    change_column :blogs, :body, :text
  end
end
