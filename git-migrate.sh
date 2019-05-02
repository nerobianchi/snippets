# For questions: Mobile Team and Sys Admins
# Script migrates all exisiting branches and tags if you need other than those information please contact
# Go to parent folder of your projects(Don't use same folder you are currently using)
# Example scenario; I'll migrate Mobile/Mobile/hb-android repo
# First create new empty repo https://git.hepsiburada.com. If you use same group and project name everything works fine.
# If you will use different group or project for new one you need to modify this script
# Go to your project folder "cd projects"
# Run script: project=hb-android group=Mobile ./migrate.sh 


#clone exisiting repo
git clone "http://gitlabnext.hepsiburada.com/$group/$project.git"
#go to cloned project folder 
cd $project
# Check if everything is ok
echo " project: $project , group: $group"
pwd

#Fetch all branches and tags from exisiting repo
git fetch --tags
git branch -a
for branch in $(git branch --all | grep '^\s*remotes' | egrep --invert-match '(:?HEAD|master)$'); do
    git branch --track "${branch##*/}" "$branch"
done
#Remove exisiting origin
git remote rm origin
#Add new origin
git remote add origin "git@git.hepsiburada.com:$group/$project.git"
#Push all branches and code
git push -u origin --all
#Push all tags
git push -u origin --tags