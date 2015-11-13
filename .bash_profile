# If you run into trouble with installing gems or bundling, try putting this before command:
# env ARCHFLAGS='-arch x86_64'

# Find current directory
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
export DOT_DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

# Include modules
source $DOT_DIR/lib/git.sh
source $DOT_DIR/lib/alias.sh
source $DOT_DIR/lib/rf.sh
source $DOT_DIR/lib/multnomah.sh
if [ -f ~/.profile ]; then
  source ~/.profile
fi
source $DOT_DIR/lib/option.sh
source $DOT_DIR/lib/prompt.sh

printf "
Hello,
          _          _                   _
         /\ \       / /\                /\ \     _
         \ \ \     / /  \              /  \ \   /\_\\
         /\ \_\   / / /\ \            / /\ \ \_/ / /
        / /\/_/  / / /\ \ \          / / /\ \___/ /
       / / /    / / /  \ \ \        / / /  \/____/
      / / /    / / /___/ /\ \      / / /    / / /
     / / /    / / /_____/ /\ \    / / /    / / /
 ___/ / /__  / /_________/\ \ \  / / /    / / /
/\__\/_/___\/ / /_       __\ \_\/ / /    / / /
\/_________/\_\___\     /____/_/\/_/     \/_/
                                                    \n"
