user = User.create!
UserDripper.subscribe(user)

puts "Run UserDripper.perform! to see magic"
