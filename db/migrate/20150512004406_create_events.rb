class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.belongs_to :user
      t.belongs_to :task
      t.timestamps
    end
  end
end
