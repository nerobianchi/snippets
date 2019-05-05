for branch in $(git branch --all | grep "^\s*remotes" | egrep --invert-match "(:?HEAD|master)$" | sed -e "s/remotes\/origin\///g"); do
    git checkout $branch
    find . -name XYZ.cs
done
