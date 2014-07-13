# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

lorem = 'Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo. Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolor sit amet consectetur adipisci[ng] velit, sed quia non numquam [do] eius modi tempora inci[di]dunt, ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit, qui in ea voluptate velit esse, quam nihil molestiae consequatur, vel illum, qui dolorem eum fugiat, quo voluptas nulla pariatur? At vero eos et accusamus et iusto odio dignissimos ducimus, qui blanditiis praesentium voluptatum deleniti atque corrupti, quos dolores et quas molestias excepturi sint, obcaecati cupiditate non provident, similique sunt in culpa, qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio, cumque nihil impedit, quo minus id, quod maxime placeat, facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet, ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.'
names = %w[Josh Bill Jim John Steph Michael Lesley Dave Zack Johnson]
emails = %w[josh@gmail.com, bill@gmail.com, jim@gmail.com, john@gmail.com, steph@gmail.com, michael@gmail.com, lesley@gmail.com, dave@gmail.com, zack@gmail.com, johnson@gmail.com]
description = 'Huge sports fan from Toronto. Jays, Leafs, Raptors, TFC, Marlies, I love them all!'
review = 'This was a great article overall.  I disagree with your view of the leafs future, but I will discuss that in my upcoming article'
titles = ['Napoli HR off Tanaka boosts Red Sox','Keselowski cut celebrating win',"Serena after loss: Tough 'being in my shoes'", 
					'A Chilean journalist flashes her national pride after a goal by Chile against Brazil in the World Cup.','Three Suarez references in one',
					'A manhunt is under way after an England fan had half his ear bitten off by a fellow supporter after the Uruguay match.',
					"Fan who was struck by lightning and pronounced dead at the scene at tonight's Columbus Crew (MLS) game lives",
					'And the most beautiful goal of World Cup 2014 goes to...',
					'Algeria face dilemma over Ramadan fasting in World Cup knockout stage',
					"James: It's not easy doing what I've done"]


names.zip(emails).each do |name, email|
	User.create(name: name, email: email, description: description, password: 'password', password_confirmation: 'password')
end

50.times do 
	Comment.create(user_id: rand(1..10), article_id: rand(1..10), body: review)
end

titles.each do |title| 
	Article.create(title: title, body: lorem, user_id: rand(1..10), post_status: 'post')
end
