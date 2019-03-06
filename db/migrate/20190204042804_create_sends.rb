class CreateSends < ActiveRecord::Migration[5.0]
  def change
    create_table :sends do |t|
      t.string :task
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
