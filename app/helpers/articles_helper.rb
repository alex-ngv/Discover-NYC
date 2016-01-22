module ArticlesHelper
  def article_params
      params.require(:article).permit(:title, :body, :tag_list, :image, :address, :latitude, :longitude, :category, :num_likes, :user_id)
  end

end
