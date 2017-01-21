BEGIN {
	
		puts title = <<TITLE
		#{'-' * 31}
		GEM HUNTER! by Nicholas Leacock
		#{'-' * 31}	
TITLE
	
}

$gem_switch = 0

module Extras
	
	def wind_up(proceed3)
		if proceed3 == "s"
			puts "Melted, Einstein! Even before you've fully conjured it. Try again."
		elsif proceed3 == "p"
			puts "REALLY? You want to block scorching hot dragonfire with...OLD DRY PAPER? Good luck with that."
		end
	end

end


class HubHelper #needed ahead of all classes so they can inherit from it, and so I can call TheHub's next_level method from any of them.
	 
	def initialize
		@the_hub = TheHub.new #a second instance of TheHub class, making this HubHelper class an annex of TheHub class. (I think this is composition)
	end
	
	def next_level(lev)
		@the_hub.next_level(lev)
	end
	

	def used_gem(where_next)
		if $gem_switch == 0							
			$gem_switch += 1
			puts "GEM! You're taking it to the next level!"
			puts
			next_level(where_next)
		else
			puts
			puts "Nice try, but you've already used the gem!"
		end
	end	

	def prompt
		print "> "
	end
	
end

#extracted the above functions from TheHub in order to avoid repeating them individually for each of the other classes in this program, as would have been necessary.

class Goblin<HubHelper
	def enter
		puts gob = <<~GOB
		
		FIFTH FLOOR: GOBLIN
		
		After scuttling up the melting staircase you come to a mosaiced floor.
		This room is normal, with a stone wall all around and numerous windows.
		There's a huge hole punched through on one side, and a little goblin
		is sitting in it. Arms folded, one skinny leg dangling over the outside.

		Being so high up, and with the gaping hole and all,
		it's quite windy. The chill makes you shudder a little.
		
		Next to the goblin, the blue Ultimate Majick Gem is — for some reason — hovering in the air.
		You walk over (with difficulty, because the soles of your feet are all gummy from the molten stairs)
		and reach up to pluck the gem from the air.
		But every time you snatch for it, it shifts out of reach.
		
		The goblin chuckles.
		
		"I am a wind-goblin." he proclaims sticking his pointy chin up at you.
		"I made this hole with my wind power and it is that power that keeps
		the Ultimate Majick Gem out of your grasp. It's mine. I was here first."
		
		You ask him why he hasn't just taken it and left. Instead of talking so much.
		He slips off his perch then jumps up and down on the spot.
		"Because I didn't know that only a human can wield it outside the walls of this bloody tower!
		That's why the hole. I tried to take it with brute force but it wouldn't go!"

		Well in that case he might as well let you have it, you suggest.

		"Never! Never! Never! I'd rather use my magic to hurl you through the hole!!"
		
		He proceeds to do so. But although you can feel the force of his wind pushing you towards the hole,
		your feet seem stuck to the floor.
			
		You realise that the molten metal of the staircase, stuck to your soles, has hardened in the cold room,
		sticking you in place.
		
		The wind-goblin, dismayed and distracted at this failure, momentarily loses control of the gem,
		which drops to the floor.
			
		Sharpish, you slip out of your boots and snatch it up.
			
		He is about to use his power on you again, but you now have an Ultimate Majick Gem in your possession
		and after those last two levels you're not unfamiliar with basic majick.
		
		Do you?
		
		[1]	Dispatch him through the hole instead by majicking a boulder to shove him through it?
		[2]	Feel sorry for him and just wrap him in a huge sheet of parchment until you safely leave with the gem?
		[3]	Skewer him to the wall with a sword?
		
GOB
	
		prompt
		respond = gets.chomp.to_i
		options = [1, 2, 3]

		until options.include?(respond)
			puts "The wind is getting stronger..."
			prompt
			respond = gets.chomp.to_i
		end

		if respond == 1
		puts boulder_attack = <<~BOULDER
		
		It works. At first. [SKULL AND CROSSBONES EMOTICON HERE]
		
		Your boulder shoves him out of the hole and sends him plummeting to the ground...

		...but his wind power saves him at the last instant.
		
		He uses it to shoot the boulder back through the hole at you.

		It crushes you against the wall leaving you resembling a red Rorshach image.
		
BOULDER

		elsif respond == 2
		puts parchment_attack = <<~PARCHMENT
		
		While he wrestles madly with a massive sheet of majickally strong parchment,
		you cast another spell then step thorugh the hole in the wall,
		floating yourself gently to the ground.
	

		You wait until you are safely some fathoms away before vanishing the parchment
		off the little tyke.

PARCHMENT

		elsif respond == 3
		puts sword_attack = <<~SWORD
		
		The blade appears at the centre of the room. It cuts towards the goblin and pins
		his arm to the wall by the sleeve of his jacket. Not as harmful as you had in mind
		but at least it'll stall him while you escape.
	
		You cast a spell and step through the hole, about to float to the ground, but you hear
		the twang of tempered steel and then the whip of it cutting through the air.
	
		You're about to duck when it lodges itself in your back.
		You feel its coldness lodged in your spine.
		You release the gem and fall through the hole.
		The goblin catches it before it drops.
		The second last thing you see is his grin.
		The last thing you see is the ground.
	
		This next event you can't see, due to a small matter of your death, but for your information...
	
		The troll exits the tower door with a knife and fork and a bottle of Worcester Sauce.
		
SWORD
		end
		return		
	end
end


class Dragon < HubHelper
	
	include Extras
	
	def enter
		puts drag = <<DRAG
		
		THIRD FLOOR: DRAGON
		
		This level also has no walls, though it is encircled with marble pillars.
		The floor is a faded fresco of a dragon in battle with a knight.
		Dead centre is an iron spiral staircase twisting up to the final
		level where the Ultimate Majick Gem awaits, trembling in anticipation...
		
		A dragon — half the size of the tower — flies into view outside.
		The gaps between the pillars are too small for it to get in...not
		so for its flames. It spews a constant stream of fire, not at you,
		but at that central iron staircase, which begins to melt...
		
		A parting gift from the sorcerer no doubt.
			
		Your gem is of no use here.
			
		If only you could block the gaps with something...
			
		Well, as it turns out, you defeated the sorcerer much quicker than he expected.
		The temporary majick he endowed you with is still there, but it's fading fast...!
DRAG
		
		response = ["p", "b", "s"]
		prompt
		proceed3 = gets.chomp

		until response.include?(proceed3)
			if proceed3 == 'gem'
				puts
				print "The gem "
				print "(if you still had one) " if $gem_switch > 0
				puts "is of no use here."
				puts "It will pointlessly take you from one side of the space to the other"
				puts "when the staircase is at the room's centre."
				puts
				prompt
				proceed3 = gets.chomp
			else
				puts "Nope."
				prompt
				proceed3 = gets.chomp
			end
		end

		until proceed3 == "b"
			wind_up(proceed3) if proceed3 == "s" || proceed3 == "p"
			puts "Somehow...you're getting colder...but the staircase is heating up!" if !response.include?(proceed3)	
			prompt
			proceed3 = gets.chomp
		end
			
		puts "Nice one! That's one gap filled...but there must be a dozen more to block!"
		puts "Keep going before the beast melts the staircase!"
		count = 0

		until count == 8
			count += 1
			prompt
			proceed3 = gets.chomp
			
			if proceed3 != "b"
				if proceed3 == "s" || proceed3 == "p" #had trouble here with ternary when prining, extra newline.
					wind_up(proceed3)
				else
					puts "You really think you have time to waste? The staircase is melting!"
				end
				count -= 1
			else
				spur_on = ["Yeah! That's it!", "Keep going!", "Hooray!", "Atta-boy/girl!",
				"Almost there!", "Don't let up now!", "That's the spirit!", "Yes! The Ultimate Majick Gem is in sight!"]
				puts spur_on.sample
			end
			
		end

		puts "Success! The dragon is blocked out!"
		puts
		puts "The room is pitch black now, but at least the staircase has started to glow..."
		puts
		next_level(:goblin)
	end
end


class InvisiWall < HubHelper
	def enter
		puts
		puts sorcerer = <<SORCERER
		
		SECOND FLOOR: SORCERER
		
		There are no walls on this floor.
		The thick frosted blue glass beneath your feet
		and the gleaming silver intricacies of the ceiling's design
		have no physical connection.
		
		You can see for miles in every direction.
		What you can't see is a way to get to the next floor.

		Then, an individual rises into view from outside.
		He wears a purple robe and a pointed purple hat with gold stars all over them.

		He introdues himself as a sorcerer. You keep your 'No shit!' response to yourself.

		Apparently, you have to show him that you're worthy
		of rising to the penultimate level before he spirits you up there.
		He grants you temporary magical abilities so that you can challenge him
		in a game called [p]archment, [s]word, [b]oulder.
		
		You must attack each other three times, each time selecting one of these items,
		neither of you knowing which the other will choose,
		and with one weapon always able to defeat the other.
		
		So...pick your weapon!			

SORCERER

	plyr_scr = 0
	wiz_scr = 0
	
		until plyr_scr == 2 || wiz_scr == 2
			prompt
			plyr = gets.chomp
			psb = [["p","b"],["b","s"],["s","p"]] #paper, scissors, rock
			wiz = psb[rand(3)][rand(2)]
			outcome = [plyr, wiz]
			weapon_of_choice = {"p" => "Parchment", "b" => "Boulder", "s" => "Sword"}
			woc = "Weapons:   You: #{weapon_of_choice[plyr]}, Him: #{weapon_of_choice[wiz]}"
		
			sword_parchment = <<SWORDPARCHMENT

			While the Sorcerer tried to read a devastating spell from his parchment,
			you sliced it to pieces with your razor sharp sword!

SWORDPARCHMENT

			parchment_boulder = <<PARCHMENTBOULDER

			The Sorcerer grew a pebble to the size of a village hut,
			but you swiftly grew your parchment too, swiftly wrapping it around the boulder,
			then dispatching it out of the wall-less room to the sky.

PARCHMENTBOULDER

			boulder_sword = <<BOULDERSWORD
			
			The Sorcerer sent a sword magically cutting through the air towards your heart,
			but you majicked a boulder in its path sending the blade clattering to the ground.
			
BOULDERSWORD


			if psb.include?(outcome) #won game
				puts "You win!"
				puts sword_parchment if plyr == "s"
				puts parchment_boulder if plyr == "p"
				puts boulder_sword if plyr == "b"
				puts woc
				puts "  Score:   You: #{plyr_scr += 1}, Him: #{wiz_scr}"
			elsif plyr == wiz #draw
				puts "Draw."
				puts woc
				puts "  Score:   You: #{plyr_scr}, Him: #{wiz_scr}"
			elsif plyr == "gem" #bail out, just in case
				used_gem(:dragon)
#				break																																						TEST THIS
			elsif !psb.join(",").include?(plyr)# stupid input/non-majick
				puts "That's rubbish majick...and it cost you a turn."
				puts "You lose."
				puts "Weapons:   You: Crap. Him: #{weapon_of_choice[wiz]}"
				puts "  Score:   You: #{plyr_scr}, Him: #{wiz_scr += 1}"
			else #lost game
				puts "You lose."
				puts woc
				puts "  Score:   You: #{plyr_scr}, Him: #{wiz_scr += 1}"
			end
		end	

		def con_sole#lost match
			puts lost = <<~LOST
			
			You have been defeated :(
						
			How could you even imagine besting someone who can keep a building upright
			after removing its middle?
			He impresses you further by separating your body into six pieces:
			limbs, torso, and head,
			— bloodlessly and painlessly —
			then having them float around the room like balloons.
				
LOST
		end
	
		def con_grat #won match
			puts win = <<~WIN

			Well done!
					
			The sorcerer congratulates you and with a wave of his wand majicks you up to the penultimate level.

WIN
		next_level(:dragon)
		end	
		puts	plyr_scr == 2 ? con_grat : con_sole
	end
end


class Charlatan < HubHelper
	def enter
		puts
		puts wretch = <<WRETCH
		
		FIRST FLOOR: WRETCH
		
		This room is dark — one window-shutter cracked slightly open — and filled with a suffocating mustiness.
		More of someone who's stayed in one place for too long than of the natural baked-in stench of the troll.
		
		The floorboards creak as someone shuffles towards you from the dark.
		It's only when they pass through the lone beam
		of sunlight that you see they are human in form, although their sex is less easy to discern.
		
		The person is not even looking at you. Their crazed, glazed and jaundiced stare,
		glaring through straggly wisps of grey hair, is fixated on the gem in your hand.
		
		"Give. It. To. Me." the voice demands, seemingly through a diseased throat.
		You shift the hand holding the glinting pink gem behind you.
		The Being makes eye contact.
		"Would you rather I use my powerful majick to transform you into a swine and take it anyway?"
		
		It approaches you, slowly.
		
		Do you:
		
		[1] Hand over the gem in case this person really is a powerful magician?
		[2] Use the gem to both escape and teleport yourself past it to the rope ladder.
		[3] Walk off, wondering why someone who can really transform you into a swine
		needs such a low-powered gem in the first place.
					
WRETCH

		prompt
		proceed1 = gets.chomp
		used_gem(:sorcerer) if proceed1 == 'gem'

		while proceed1.to_i > 3 || proceed1.to_i < 1
			puts
			puts "Did you drop your glasses between here and the troll level?" unless $gem_switch > 1
			puts "Select 1, 2 or 3."
			puts
			prompt
			proceed1 = gets.chomp
			used_gem(:sorcerer) if proceed1 == 'gem'
		end

		if proceed1 == '1'
			puts trapped = <<~TRAPPED
			
			Not so smart. That was no witch or sorcerer.
			It was just an adveturer like you who — one thousand years ago —
			set out to get the Ultimate majick Gem.
			The poor wretch only got so far before being trapped on that floor by a sorcerer.

			Guess who's taking his place now?

TRAPPED
		elsif proceed1 == '2'
			puts "Fair enough. Here's hoping you don't need it on one of the latter levels."
			used_gem(:sorcerer)
		elsif proceed1 == '3'
			puts escape = <<~ESCAPE
		
			The wretch scutters behind you as you make for the rope ladder.
		
			It grabs hold of your leg shouting: 'GimmeGimmeGimmeGimmeGimme!'
			You kick it off and shimmy up the rope ladder.
			It tries to follow you,
			but ends up screaming in agony as majick blue doomfire scorches its hands when it touches the rope.
		
			Turns out the poor wretch was just an adventurer like you who — one thousand years ago —
			set out to get the Ultimate majick Gem,
			but it only got so far before being trapped on that floor by the sorcerer you are about to meet..."
ESCAPE
			next_level(:sorcerer)
		end
	end
end


class InvisiTroll < HubHelper	
	def enter
		puts
		puts troll = <<TROLL
		GROUND FLOOR: TROLL
		
		The door to the tower is huge. It would fit you at twice your height and breadth.
		You heave it open and enter a single large room.
		Two small arched windows left and right of you.
		A wooden staircase just visible through the dim light on the opposite side of the room,
		and a stench that turns your stomach like a bucket of wounded eels.
		
		You begin to cross the grey stone floor, surprised at how easy this is turning out to be, when...
		You walk into something, though there's nothing to see.
		It grunts, and then turns visible.
		
		An Invisi-troll.
		
		Massive, crouched because the ceiling is too low for him, and furious at being woken.
		He swings his club at you, only able to do so horizontally because of the low ceiling. 
	
		Do you [d]uck? or do you [j]ump?
			
TROLL

		prompt
		proceed0 = gets.chomp
		troll_attack = [1, 0, 0, 0,].sample
		collected = ["d", "gem", "j"]
		
		while !collected.include?(proceed0)
			puts
			puts "Wait a minute, is this troll going off-script and using a blind spell on you that I don't know about?"
			puts "Select 'd' or 'j'"
			prompt
			proceed0 = gets.chomp
		end
		if proceed0 == "gem"
			used_gem(:witch)
			return
		end
		if troll_attack.odd?
			if proceed0 == "d"
				puts
				puts troll_swipe = <<~TROLLSWIPE
				
				Too bad. You ducked when he swung low.
				You're a bug-splat halfway up the wall on the other side of the room.
				Still in a crouched position.
				Slowly slipping down until you're a bloody mass on the floor.

TROLLSWIPE

			elsif proceed0 == "j"

				puts unlucky = <<~UNLUCKY
				
				The troll whacks you in the head while you're in mid-air.
				You spin...three times.
				Finally, you clump to the cold stone floor in a mass of limp, broken flesh.
				The troll lumbers over, tucking a grubby napkin into the neck of his vest...
				
UNLUCKY
			end				
		else
			puts "Nice! He misses!"
			puts
			puts "You time it so that in the instant where he fights his own momentum you dash for the stairs at the other side."
			puts
			next_level(:witch)
		end
	end
end


class TowerStart < HubHelper	
	def enter
		puts 
		puts start = <<START
		
		TOWER - OUTSIDE
		
		You're standing at the foot of the Tower.
		It's a huge stone cylindrical edifice, five floors high with a pointed roof.
		In the topmost room there is an Ultimate majick Gem.

		You already have a low-level one-use gem that will teleport you from one side of a room to the next,
		after which it becomes no more than a pretty pink stone.
		
		[Type 'gem' then ENTER at any time to use it.]
		[Other options are highlighted in square brackets.]
	
		That pink gem, your wits, and raw luck are the tools you must use to get the Ultimate majick Gem!
		
START

		puts
		puts "Hit ENTER to get started."

		prompt
		proceed = gets.chomp
		
		while proceed != ""
			puts
			puts "You might as well give up now if you can't follow simple instructions!"
			puts "Let's try that again."
			prompt
			proceed = gets.chomp
		end		
		next_level(:troll)
	end	
end

at_exit { puts "-" * 76
	puts "Thank you for playing my game. I hope none of my smart remarks offended you."
	puts "-" * 76
	puts
}

class TheHub
	@@levels = {start: TowerStart.new, troll: InvisiTroll.new,
		 					witch: Charlatan.new, sorcerer: InvisiWall.new,
							dragon: Dragon.new, goblin: Goblin.new} #a Hash of instance objects-in-waiting stored as the class variable @@levels

	def initialize(begin_play)
		@begin_play = begin_play #variable ('start')from instantiation (x = TheHub.new(:start))
	end
	
	def start_game
		return next_level(@begin_play)#(:start)
	end
	
	def next_level(level_is)#(:start) as argument passed to next_level's parameter from the call in the start_game method.
		return @@levels[level_is].enter# == (Hash name/variable[key] => value) == value.enter == A call to the appropriate instance's enter method.
	end
	
end


x = TheHub.new(:start)# first of two instances of the TheHub class. The symbol :start is the variable passed to TheHub's initialize method as an argument, kicking the whole program off.

x.start_game#calling TheHub's start_game method



