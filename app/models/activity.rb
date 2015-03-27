class Activity < ActiveRecord::Base
  belongs_to :course, class_name: "Course", foreign_key: "source_id"
  belongs_to :user, class_name: "User", foreign_key: "source_id"
  belongs_to :group, class_name: "Group", foreign_key: "source_id"
end
