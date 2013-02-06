class AddUserNameToMementos < ActiveRecord::Migration
  def change
    add_column :mementos, :user_name, :string
  end
end
