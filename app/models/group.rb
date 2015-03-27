class Group < ActiveRecord::Base
  has_many :activities, class_name: "Activity", foreign_key: "source_id"
end
