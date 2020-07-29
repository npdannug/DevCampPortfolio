User.create!(
  email: 'admin@mail.com',
  password: 'norman',
  password_confirmation: 'norman',
  name: 'Admin User',
  roles: 'site_admin'
)

User.create!(
  email: 'test@mail.com',
  password: 'norman',
  password_confirmation: 'norman',
  name: 'Guest User',
  roles: ''
)

puts "2 users created"


3.times do |topic|
  Topic.create!(
    title: "Topic #{topic}"
  )
end

puts "3 Topics created"

10.times do |blog|
  Blog.create!(
    title: "My Blog Post #{blog}",
    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut 
     labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation 
     ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in
     voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat 
     non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Duis aute irure dolor in reprehenderit in
     voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat 
     non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Duis aute irure dolor in reprehenderit in
     voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat 
     non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    topic_id: 3
  )
end

puts "10 blogs created"


Skill.create!(
  title: "Ruby on Rails",
  percent_utilized: 60
)

Skill.create!(
  title: "C#",
  percent_utilized: 80
)

Skill.create!(
  title: "MS Dynamics CRM",
  percent_utilized: 50
)

Skill.create!(
  title: "MS SQL Database Management",
  percent_utilized: 60
)

Skill.create!(
  title: "Front End Management",
  percent_utilized: 60
)

Skill.create!(
  title: "Visual Basic",
  percent_utilized: 65
)

Skill.create!(
  title: "Javascript",
  percent_utilized: 65
)

puts "5 Skills created"

9.times do |p|
  Portfolio.create!(
  	title: "My Porfolio #{p}",
  	subtitle:"My Porfolio subtitle #{p}",
  	body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut 
     labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation 
     ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in
     voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat 
     non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Duis aute irure dolor in reprehenderit in
     voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
  	main_image:"https://via.placeholder.com/600x400",
  	thumb_image: "https://via.placeholder.com/350x200",
    position: p + 1
  )
end

puts "9 Porfolios created"


3.times do |tech|
  Technology.create!(
    name: "Technology #{tech}",
    portfolio_id: Portfolio.last.id
  )
end

puts "3 technologies created"