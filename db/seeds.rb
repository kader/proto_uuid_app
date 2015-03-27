# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name: "Nurettin Değişmen")
User.create(name: "Ahmet Can Arıcan")
User.create(name: "Okan Gözel")
User.create(name: "Tunç Başaran")
User.create(name: "Fatma Sıdıka Yücel")
User.create(name: "Seyit Akman")
User.create(name: "Gökhan Türkan")
User.create(name: "Gönül Göktaş")
User.create(name: "Onur Atilla")
User.create(name: "Özkan Kaya")

User.find_each do |user|
  20.times do
    Activity.create(name: user.name, source_id: user.id)
  end
end

Course.create(name: "Başlangıç Seviyesi İngilizce", user_id: User.first.id)
Course.create(name: "Excel Uzmanlık Eğitimi", user_id: User.last.id)

Course.find_each do |course|
  10.times do
    Activity.create(name: course.name, source_id: course.id)
  end
end

Group.create(name: "BSI Group 1")
Group.create(name: "BSI Group 2")
Group.create(name: "EUE Group 1")

Group.find_each do |group|
  5.times do
    Activity.create(name: group.name, source_id: group.id)
  end
end
