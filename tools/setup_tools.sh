# full path to this script's directory
SCRIPTDIR=$(dirname $(readlink -f $0))

# make ~/.local/bin/ if it doesn't exist
mkdir -p ~/.local/bin/

# symbolic link of `seal` in current directory to ~/.local/bin/
ln -s ${SCRIPTDIR}/seal ~/.local/bin/seal
