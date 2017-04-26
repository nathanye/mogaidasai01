# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "這個種子檔會自動建立一個admin帳號, 並且創建 10 個 public jobs, 以及10個hidden jobs"

create_account = User.create([email: 'admin@gmail.com', password: '123456', password_confirmation: '123456', is_admin: 'true'])
puts "Admin account created."

job_title = [
  '吧台主管',
  '服务员',
  '灯光师',
  '调音师',
  '调酒师',
  '舞台助理',
  '现场经理',
]

job_description = [
  '具备吧台管理经验者优先，有一定的服务意识，英文口语流利',
  '具备一定英文口语交流水平，具备主动服务意识',
  '有舞台灯光经验者优先，具备一定舞美设计水平',
  '音乐相关专业，要求调音经验丰富',
  '有一定舞美设计经验者优先，配合灯光师、调音师完成舞台效果设计',
  '协助现场经理管理吧台；协助维护演出现场秩序'
]

for i in 1..10 do
  Job.create!([
    title: job_title[rand(job_title.length)],
    description: job_description[rand(job_title.length)],
    wage_upper_bound: rand(40..58) * 1000,
    wage_lower_bound: rand(20..30) * 1000,
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
