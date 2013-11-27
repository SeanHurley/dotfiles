function fish_prompt --description 'Write out the prompt'
    # Just calculate these once, to save a few cycles when displaying the prompt
    if not set -q __fish_prompt_hostname
        set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
    end

    if not set -q __fish_prompt_normal
        set -g __fish_prompt_normal (set_color normal)
    end

    if test (git rev-parse > /dev/null 2>&1;echo $status) -eq 0
      if not set -q __git_cb
          set branch (git branch ^/dev/null | grep \* | sed 's/* //')(set_color normal)
          set __git_cb "@"(set_color brown)"$branch"
      end

      if not set -q __git_mod
          set __git_mod (set_color red)(git ls-files -m ^/dev/null | wc -l | sed -e 's/^[ \t]*//')(set_color normal)""
      end

      if not set -q __git_unt
          set __git_unt (set_color yellow)(git ls-files --other --exclude-standard | wc -l | sed -e 's/^[ \t]*//')(set_color normal)""
      end

      if not set -q __git_staged
          set __git_staged (set_color green)(git diff --name-only --cached | wc -l | sed -e 's/^[ \t]*//')(set_color normal)""
      end

      if not set -q __git_ahead
          set -lx remote (git remote show)
          set -lx ahead (git log --oneline $remote/HEAD.. 2> /dev/null | wc -l | sed -e 's/^[ \t]*//')
          if not test $ahead -eq 0
            set __git_ahead "↑"(set_color white)$ahead(set_color normal)""
          end
      end

      if not set -q __git_behind
          set -lx remote (git remote show)
          set -lx behind (git log --oneline HEAD..$remote/HEAD 2> /dev/null | wc -l | sed -e 's/^[ \t]*//')
          if not test $behind -eq 0
            set __git_behind "↓"(set_color white)$behind(set_color normal)""
          end
      end
    end

    switch $USER

        case root

        if not set -q __fish_prompt_cwd
            if set -q fish_color_cwd_root
                set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
            else
                set -g __fish_prompt_cwd (set_color $fish_color_cwd)
            end
        end

        printf '%s@%s:%s%s%s%s# ' $USER $__fish_prompt_hostname "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal" $__git_cb

        case '*'

        if not set -q __fish_prompt_cwd
            set -g __fish_prompt_cwd (set_color $fish_color_cwd)
        end

        if test (git rev-parse > /dev/null 2>&1;echo $status) -eq 0
          printf '%s@%s:%s%s%s%s:[%s][%s][%s]%s%s$ ' $USER $__fish_prompt_hostname "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal" $__git_cb $__git_staged $__git_mod $__git_unt $__git_behind $__git_ahead
        else
          printf '%s@%s:%s%s%s%s$ ' $USER $__fish_prompt_hostname "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal"
        end
    end
end
