# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "這個種子檔會自動建立一個admin帳號, 並且創建 10 個 public jobs, 以及10個hidden jobs"

create_account = User.create([email: 'milesmao233@gmail.com', password: '111111', password_confirmation: '111111', is_admin: 'true'])
puts "Admin account created."

job_title = [
  'Account Manager',
  'New Business Sales',
  'Analyst',
  'Sales Engineer',
  'Test Engineer',
  'Creative Designer',
  'Events Planner',
]

job_description = [
  'Deliver engaging content and communications with your strategy and publishing experience.',
  'Plan, produce, and execute impactful events throughout Google.',
  'Define and evolve Google’s design and creative direction when you produce creative digital assets and branding materials.',
  'Create innovative and strategic plans and campaigns to engage Googlers across the globe.',
  'Draw strategic insights and create solutions from complex data.',
  'Develop external communications strategies to captivate global audiences through compelling written and visual media.'
]

for i in 1..10 do
  Job.create!([
    title: job_title[rand(job_title.length)],
    description: job_description[rand(job_title.length)],
    wage_upper_bound: rand(40..79) * 1000,
    wage_lower_bound: rand(20..39) * 1000,
    is_hidden: 'false'
  ])
end

for i in 1..10 do
  Job.create!([
    title: job_title[rand(job_title.length)],
    description: job_description[rand(job_title.length)],
    wage_upper_bound: rand(40..79) * 1000,
    wage_lower_bound: rand(20..39) * 1000,
    is_hidden: 'false'
  ])
end

puts "10 Hidden jobs created."
puts "10 Public jobs created."
