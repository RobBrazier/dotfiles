function git
    switch $argv[1]
        case clone
            clone $argv 
        case set-email
            set_email $PWD
        case '*'
          command git $argv
    end
end

function build_email
    set -l repo_hostname $argv[1]

    switch $repo_hostname
        case git.sr.ht
            set -f email_tag srht
        case '*'
            set -f email_tag (string split -f1 '.' $repo_hostname)
    end
    echo "git+$email_tag@brzr.co"
end

function set_email
    set -l repo_path $argv[1]
    set -l remote_url (command git -C $repo_path remote get-url origin)

    if string match -rq "git@" $remote_url
        set -l remote_url (string replace 'git@' '' $remote_url)
        set -f remote_hostname (string split -f1 ':' $remote_url)
    else if string match -rq "https://" $remote_url
        set -l remote_url (string replace 'https://' '' $remote_url)
        set -f remote_hostname (string split -f1 '/' $remote_url)
    end

    set -l new_email (build_email $remote_hostname)

    if [ (command git -C $repo_path config user.email) = $new_email ]
        echo "Email already configured for $repo_path as $new_email"
    else
        echo "Setting email for $repo_path to $new_email"
        command git -C $repo_path config --unset user.email
        command git -C $repo_path config user.email $new_email
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
            set -l targetPath "$sourceHome/$gitHost/$gitUser/$repository"
            command git clone "git@$gitHost:$gitUser/$repository" $targetPath
            set_email $targetPath
        end
    end
end
