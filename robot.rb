require 'colored'

class Robot

	attr_accessor :robot_name, :user_name, :robot_color, :user_color



	@@greetings = [
		"Heeeey there how you doing long time! hows the going?",
		"Niajez dear how's home? Fam? Life?",
		"Mtu wangu how have you been?",
		"hey there me am good.. wewe je..habari ya utokako?"
	]

	@@goodAfterColorings = [
		"Wooohooo.. so happy for you dear..",
		"Wow.!.. Mtu wangu si uko mbele.., heri wewe dear..",
		"Awesome.! you are Blessed for that dear..",
		"Lucky you dear, sisi huku its the opposite..iyo risto imetukataa.."
	]

	@@badAfterColorings = [
		"Woooooi.. that's sad to hear :(..",
			"Pole dear..",
			"Eish.. woiyee..",
			"Aiyayaiya.! am sorry dear to learn about that.."
		]

	@@afterColorings = [
			"Ok.. So niambie.. how's the weather up there.? has the Sun decided to unleash.?",
			"Ok, sema, have you gotten a job?..",
			"Ehe.. sema story, are you on twitter..?",
			"Soo.. have you finished Percila's assignment.? "
	]

	@@goodbyes = [
			"My dear #{@user_name}.. unfortunately i am over.. theres nothing more for me to say.. be grateful to God that you are not a computer program.. toodles darling...",
			"Auuuwi.. imagine #{@user_name} nimefika end of program.. wololo....",
			"Ooopsy #{@user_name}.!.. my internals tell me i have kwished..:(..",
				"Kuisha nayo.. bye bye my dear #{@user_name}",
				"Oi.. #{@username} it was a pleasure chatting witch'ya.. but i have to run..byee"
	]

	def terminal
		colors = ["red","blue","black","yellow"]
		color = colors[rand(colors.length)]
		codeColor = "'Terminal-->'.bold."+color
		robot_name = eval codeColor
		
	end

	def computer
		puts
		sleep(1)
		puts terminal
		sleep(1)
	end

	def get_name
		name = gets.chomp+"-->"
		@user_name = name
	end


	def user
		sleep(1)
		puts
		puts @user_name
	end

	def get_greeting
		greeting = @@greetings[rand(@@greetings.length)].split.insert(2, @user_name+"..!").join(" ")
		greeting
	end

	def get_afterColoring
		afterColoring = @@afterColorings[rand(@@afterColorings.length)]
		afterColoring
	end

	def get_goodAfterColoring
		goodAfterColoring = @@goodAfterColorings[rand(@@goodAfterColorings.length)]
		goodAfterColoring
	end

	def get_badAfterColoring
		badAfterColoring = @@badAfterColorings[rand(@@badAfterColorings.length)]
		badAfterColoring
	end

	def get_goodbye
		goodbye = @@goodbyes[rand(@@goodbyes.length)]
		goodbye
	end

	def hour_greeting
		hour = Time.now.hour
		if hour < 12
			hello = "Good Morning"
		elsif hour >= 12 and hour < 16
			hello = "Good Afternoon"
		else
			hello = "Good Evening"
		end
	end

	def start
		computer
		print hour_greeting
		sleep(1)
		print " dear friend!.."
		sleep(1)
		print " What can i call you? :) .. "
		get_name
	end

	def request_for_color
		computer
		puts get_greeting

		#request for color
		user
		gets.chomp
		computer
		print "Sorry "+@user_name+" before we continue.."
		sleep(1)
		print "would you like your name to be in color like me.."
		sleep(1)
		puts "or you are just ok being plain and boring.? :p.."
		sleep(1)
	end

	def user_get_color
		user
		color = gets.chomp
		@user_color = color
		evaluate_color
	end

	def ask_for_color
		user
		reply = gets.chomp
		computer
		if reply.include? "no"
			print "Ok cool.. plain and boring you is.. :).."
		else
			puts "Hooray.. ok tell me your color I set you up.."
			user_get_color

		end
	end

	def evaluate_color
		code = "'"+@user_name+"'.bold." + @user_color
		if "string".methods.include? @user_color.to_sym
			@user_name = eval code
			computer
			puts "Great choice of color there #{@user_name}..! I like #{@user_color} too :).."
		else
			puts "Sorry, I don't have #{@user_color}. Please try another. :P..."
			user_get_color
		end
	end

	def last_talk
		puts get_afterColoring
		sleep(1)
		user
		sleep(1)
		answer = gets.chomp.downcase

		computer

		if answer.include? "yes"
			puts get_goodAfterColoring
		elsif answer.include? "no"
			puts get_badAfterColoring
		else
			puts "Aki woiye si you include atleast one 'yes' or 'no' in your answer so that i can choose an answer from within and i don't end up sounding like a machine...:).."
		end
	end
	def goodbye
		user
		gets.chomp
		computer
		puts get_goodbye
		sleep(3)
	end
end


robot = Robot.new
robot.start
robot.request_for_color
robot.ask_for_color
robot.last_talk
robot.goodbye
