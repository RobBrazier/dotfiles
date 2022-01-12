set signed_hosts izanagi

function git
  switch $argv[1]
    case clone
      echo "clone"
      command git $argv 
    case commit
      if not contains -- '--help' $argv
        if contains (uname -n) $signed_hosts
            command git commit -S $argv[2..]
        else
            command git commit $argv[2..]
        end
      else
        echo "git $argv"
        command git $argv
      end
    case '*'
      command git $argv
  end
end
