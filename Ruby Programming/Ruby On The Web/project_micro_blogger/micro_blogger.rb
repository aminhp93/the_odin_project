require 'jumpstart_auth'
require 'bitly'
require 'klout'

class MicroBlogger
	attr_reader :client

	def initialize
		puts "Initializing MicroBlogger"
		Bitly.use_api_version_3
		@bitly = Bitly.new("hungryacademy", "R_430e9f62250186d2612cca76eee2dbc6")
		Klout.api_key = "xu9ztgnacmjx3bu82warbr3h"
		puts "initialziing"
		@client = JumpstartAuth.twitter
	end

	def tweet(message)
		if message.length <= 140
			@client.update(message)
		else
			puts "Tweet is too long!"
		end
	end

	def dm(target, message)
		puts "Trying to send #{target} this direct message:"
		puts message
		screen_names = @client.followers.collect {|i| @client.user(i).screen_name}

		if screen_names.include?(target)
			sms = "d @#{target} #{message}"
			self.tweet(sms)
		else
			puts "You can only DM people following you! #{target} is not on your following list!"
		end
	end

	def followers_list
		screen_names = []
		@client.follower.users.each do |i|
			screen_names << i["screen_name"]
		end
		return screen_names
	end

	def spam_my_followers(message)
		screen_names.each do |i| 
			dm(i, message)
		end
	end

	def everyones_last_tweet
		friends = @client.followers.collect {|i| @client.user(i).screen_name}
		friends.each do |i|
			# find each friend's last message
			timestamp = i.status.created_at
			puts "#{i.screen_name} said this on #{timestamp.strftime("%A, %b %d")}"
			puts "#{i.status.text}"
			# print each friend's screen_name
			# print each frined's last message
			# print a blank line to seperate people
			puts ""
		end
	end

	def shorten(original_url)
		puts "Shortening this URL: #{original_url}"
		return @bitly.shorten(original_url)
	end

	def klout_score
		friends = @client.friends.collect{|i| @client.user(i).screen_name}
		friends.each do |i|
			p "#{i}"
			j = Klout::Identity.find_by_screen_name(i)
			user = Klout::User.new(j.id)
			puts "#{user.score.score}"
		end
	end

	def run
		puts "Welcome to the JSL Twitter Client!"
		command = ""
		while command != "q"
			p "enter command: "
			input = gets.chomp
			parts = input.split(" ")
			command = parts[0]
			case command 
				when 'q' then puts "Goodbye!"
				when 't' then tweet(parts[1..-1].join(" "))
				when 'dm' then dm(parts[1], parts[2..-1].join(" "))
				when 'spam' then spam(parts[1..-1].join(" "))
				when 'elt' then everyones_last_tweet
				when 's' then shorten(parts[1..-1].join(" "))
				when 'turl' then tweet(parts[1..-2].join(" ") + " " + shorten(parts[-1]))
				when 'k' then klout_score
				else
					puts "Sorry, I don't know how to #{command}"
			end
		end
	end
end
blogger = MicroBlogger.new
blogger.run

