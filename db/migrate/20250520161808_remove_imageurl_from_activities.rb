class RemoveImageurlFromActivities < ActiveRecord::Migration[7.1]
  def change
    remove_column :activities, :image_url, :string
  end
end
