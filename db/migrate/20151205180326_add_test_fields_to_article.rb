class AddTestFieldsToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :test,   :string
  end
end
