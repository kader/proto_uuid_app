class Course < ActiveRecord::Base
  belongs_to :user
  has_many :activities, class_name: "Activity", foreign_key: "source_id"
end
