class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :articles, :test, :category
    rename_column :users, :usernae, :username
  end
end
