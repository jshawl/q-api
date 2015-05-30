class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.string :device_token
      t.belongs_to :user
    end
  end
end
