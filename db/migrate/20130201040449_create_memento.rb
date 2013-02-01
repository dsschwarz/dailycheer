class CreateMemento < ActiveRecord::Migration
  def change
    create_table :memento do |t|

      t.string :body
      t.timestamps
    end
  end
end
