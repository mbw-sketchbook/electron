# 
# Add useful submodule aliases from
#
#   ref: https://git-scm.com/book/en/v2/Git-Tools-Submodules
git config alias.sdiff '!'"git diff && git submodule foreach 'git diff'"
git config alias.supdate 'submodule update --remote --merge'


#
# Update the wiki submodule to the latest commit, and
# commit the change to the parent repo.
#
function sync_wiki {
    git submodule update --remote --merge
    if [[ -n "$(git status --short)" ]]; then
        git add skb-electron.wiki/
        git commit -m "Updating to latest wiki ref."
    fi
}
