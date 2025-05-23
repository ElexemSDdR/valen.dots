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
