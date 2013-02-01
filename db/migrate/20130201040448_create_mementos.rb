class CreateMementos < ActiveRecord::Migration
  def change
    create_table :mementos do |t|

      t.string :body
      t.timestamps
    end
  end
end
