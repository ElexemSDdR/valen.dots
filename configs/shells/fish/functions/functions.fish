function show_paths
  for val in $PATH
    echo "$val"
  end
end

function md -a file_name -d "Create and open in nvim a md file"
  nvim $file_name.md
end

function show_fish_prompts
  for prompt in $(fish_config prompt list)
    fish_config prompt show $prompt
  end
end
