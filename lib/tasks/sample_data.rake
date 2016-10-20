namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		User.create!(name: "Chris Branson",
								 email: "chris.branson@insphire.com",
								 password: "123456",
								 password_confirmation: "123456")

		99.times do |n|
			name = Faker::Name.name
			email = "example-#{n}@dummy.com"
			password = "123456"

			User.create!(name: name, email: email, password: password, password_confirmation: password)
		end
	end
end
