# Show all the values of the env variable "PATH"
function show_paths
  for val in $PATH
    echo "$val"
  end
end

# Create a markdown file and open nvim to edit it
function md -a file_name -d "Create and open in nvim a md file"
  nvim $file_name.md
end

# Show all the prompts of fish
function show_fish_prompts
  for prompt in $(fish_config prompt list)
    fish_config prompt show $prompt
  end
end

# Change the global config of git to another user.
function change_git_profile -a user
  if $user = ""
    echo "Choose an user" && set status 1
    # Put here your own configuration to change between users (if you have more than 1 user)
    # use the command `git config --global user.name` and the same but for the email (user.email)
  end
  gh auth login
end
