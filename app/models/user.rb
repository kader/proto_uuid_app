class User < ActiveRecord::Base
  has_many :courses
  has_many :user_activities, class_name: "Activity", foreign_key: :source_id

  def activities
    Activity.where(source_id: (self.courses.map(&:id) << self.id))
  end
end
