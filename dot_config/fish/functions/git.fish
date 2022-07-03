set -l signed_hosts izanagi

function git
    switch $argv[1]
        case clone
            clone $argv 
        case commit
          if not contains -- '--help' $argv
            if contains (uname -n) $signed_hosts
                command git $argv -S
            else
                command git $argv
            end
          else
            echo "git $argv"
            command git $argv
          end
        case '*'
          command git $argv
    end
end

function clone
    set -l currentDir "$PWD"
    set -l sourceHome "$HOME/Code"
    set -l sourceDirChildPath (string replace "$sourceHome" "" "$currentDir") 
    if [ "$sourceDirChildPath" = "$currentDir" ]
        command git $argv
    else
        set -l gitParts (string split '/' $sourceDirChildPath)
        set -l gitHost $gitParts[2]
        set -l gitUser $gitParts[3]

        set -l repository $argv[2]
        switch $repository
        case "*/*"
            command git $argv
        case "*--help"
            command git $argv
        case "*"
            command git clone "git@$gitHost:$gitUser/$repository" "$sourceHome/$gitHost/$gitUser/$repository"
        end
    end
end
