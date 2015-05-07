class CreateGroupings < ActiveRecord::Migration
  def change
    create_table :groupings do |t|
      t.belongs_to :group
      t.belongs_to :user
    end
  end
end
