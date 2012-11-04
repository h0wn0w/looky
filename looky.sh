#!/bin/sh

VALUE=" "
printf "What can I help you find? -> "
read TEXT
IFS=" "
for VALUE in $TEXT ; do
	if [[ $(mdfind -count $VALUE) = 0 ]]; then
		#statements
		echo "Sorry, I couldn't find a damn thing."
		sleep 2
		echo "Or maybe it's not me. Maybe you fat-fingered something."
		sleep 2
		echo "I'm just saying. It's possible. Try again, ace."
	break
	elif [ $(mdfind -count $VALUE) -ge 100 ] ; then
		printf "I found $(mdfind -count $VALUE) results. " 
		sleep 1
printf "That's a lot. Let's narrow things down a bit. " 
sleep 1
printf "Do you want:
a file with that 'name', 'text' inside a file, or do you want to 'bail'? ->  "		
		read ANSWER
			if [ "$ANSWER" = "name" ] ; then
				printf "Do you want me to pipe the results to a file on the desktop? Y or N -> "
				read CONF
				if [[ "$CONF" = "Y" ]] ; then
					echo "Right on - I'll put them there right now."
					mdfind -name $TEXT > ~/Desktop/queryResults.txt
				break
				elif [[ "$CONF" = "N" ]]; then
					echo "Okay. This might be like drinking from the fire hose."
				sleep 2
				mdfind -name $TEXT
				fi
			break
			elif [ "$ANSWER" = "text" ] ; then
				echo "It looks like $TEXT is in the following:"
				sleep 2
				mdfind -name -interpret "$TEXT" | grep "$TEXT[a-z A-Z]"
			break
			elif [[ "$ANSWER" = "bail" ]]; then
				#statements
				echo "Good deal. Better luck next time."
			break
			fi
	elif [ $(mdfind -count $VALUE) -lt 100 ] ; then
			echo "Here's what I found for $TEXT:"
	fi
done