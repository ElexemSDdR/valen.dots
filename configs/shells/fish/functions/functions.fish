function fish_greeting
  # Add the day of the year of your birthday to do well the message, mi birthday is on the 253 day of the year, you have to put the day of yours
    if test (date +%H) -ge 12
      echo "Good afternoon, $USER! today is $(date +%D)."
      echo "Only $(echo "365 - $(date +%j)" | bc) left until end the year 🎉." 
      echo "$(echo "359 - $(date +%j)" | bc) left until Christmas 🎅." 
      echo "And $(echo "253 - $(date +%j)" | bc) until your birthday 🎂."
      echo "Cheer up, tomorrow is another day ✨ try no give up."
    else
      echo "Good morning, $USER! today is $(date +%A) $(date +%D)." 
      echo "Only $(echo "365 - $(date +%j)" | bc) left until end the year 🎉." 
      echo "$(echo "359 - $(date +%j)" | bc) left until Christmas 🎅." 
      echo "And $(echo "253 - $(date +%j)" | bc) until your birthday 🎂."
      echo "Cheer up, tomorrow is another day ✨ try no give up."
    end
end

function show_paths -d 'Show all the paths on the $PATH env'
  for val in $PATH
    echo "$val"
  end
end

function md -a file_name -d "Create and open in nvim a md file"
  if not test $file_name
    nvim file.md
  end
  nvim $file_name.md
end

function show_fish_prompts -d "Show all the fish prompts"
  for prompt in $(fish_config prompt list)
    fish_config prompt show $prompt
  end
end

# Git functions
function gcmm -a message -d "Do a commit with a message"
  if not test $message
    echo "Ingrese un mensaje para el commit"
    return
  end
  git commit -m "$message" -a
end

function fuck -d "Correct your previous console command"
  set -l fucked_up_command $history[1]
  env TF_ALIAS=fuck PYTHONIOENCODING=utf-8 thefuck $fucked_up_command | read -l unfucked_command
  if [ "$unfucked_command" != "" ]
    eval $unfucked_command
    builtin history delete --exact --case-sensitive -- $fucked_up_command
    builtin history merge ^ /dev/null
  end
end
