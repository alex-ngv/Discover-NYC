class AddLike < ActiveRecord::Migration
  def change
    add_column :articles, :num_likes,    :integer
  end
end
