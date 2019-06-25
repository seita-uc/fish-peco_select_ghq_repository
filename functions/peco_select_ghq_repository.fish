function peco_select_ghq_repository
  set -l query (commandline)

  if test -n $query
    set peco_flags --query "$query"
  end

  ghq list | peco $peco_flags | read line

  if [ $line ]
    # ghq look $line
    set root (ghq root)
    set directory (string join / $root $line) 
    cd $directory
    commandline -f repaint
  end
end
