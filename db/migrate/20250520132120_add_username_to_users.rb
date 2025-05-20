class AddUsernameToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :username, :string
    add_column :users, :age, :integer
    add_column :users, :description, :text
    add_column :users, :image_url, :string
    add_column :users, :city, :string
  end
end
