# config.nu
#
# Installed by:
# version = "0.103.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.


# PROMPT_COMMAND shows some on the line to type commands before the cursor. It could be static (like "nushell" or "from valen") 
# or dynamic (like the pwd or the time)
#
# And PROMPT_INDICATOR show some sfter the PROMPT_COMMAND and before the cursor, it is the indicator of the init of the prompt 
# like "$ " or "> "
$env.PROMPT_INDICATOR = " $ "

# TRANSIENT_PROMPT_COMMAND print what you want after exec some command at the start of the line and then the output of the command  
# Example: $ echo "hello nushell"
# > hello nushell

$env.TRANSIENT_PROMPT_COMMAND = "> "

mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
