class DisallowNilSlugs < ActiveRecord::Migration[8.0]
  def change
    change_column_null :articles, :slug, false
    change_column_null :users, :slug, false
  end
end
