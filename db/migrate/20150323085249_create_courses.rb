class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses, id: :uuid do |t|
      t.string :name
      t.uuid :user_id
      t.timestamps
    end
  end
end
