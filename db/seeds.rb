# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Event.destroy_all
names = %w[
  Yannick
  Sainath
  Mark
  Deeon
  Vanessa
  Karen
  Murphy
  Joanna
  Peter
  Kim
  Alice
  Dean
  Ananda
  Matthew
  Jackie
  Suz
  Chris
  Jordan
  Ryan
]
start_time = DateTime.parse('17-05-2021 14:00')
end_time = DateTime.parse('17-05-2021 14:10')
until names.empty?
  unless start_time.between?(DateTime.parse('05-06-2021'), DateTime.parse('13-06-2021'))
    student = names.sample
    Event.create(name: "#{student}'s Lightning Talk", start_time: start_time, end_time: end_time)
    names.delete(student)
    student2 = names.sample
    Event.create(name: "#{student2}'s Lightning Talk", start_time: start_time + 2.days, end_time: end_time + 2.days) unless student2.nil?
    names.delete(student2)
  end
  start_time += 1.week
  end_time += 1.week
end
