while read -r repo; do gh repo delete "$repo" --yes; done < repos.txt

