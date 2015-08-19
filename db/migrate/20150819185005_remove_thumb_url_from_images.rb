class RemoveThumbUrlFromImages < ActiveRecord::Migration
  def change
    remove_column :images, :thumb_url
  end
end
