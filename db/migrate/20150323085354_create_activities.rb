class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities, id: :uuid do |t|
      t.string :name
      t.uuid :source_id
      t.timestamps
    end
  end
end
