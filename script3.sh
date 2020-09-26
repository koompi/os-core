export KFS=/mnt/kfs

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

echo "now you need to have the wget-list in the AKFS/res"
read -p "press key to continue" key
if [ $(find res/wget-list | wc -l) -eq 1 ]; then
    echo "wget-list found"
else
    echo "wget-list not found in $(pwd)/res"
    exit 1
fi
#bash res/chp3Intro.sh

mkdir -v $KFS/sources
chmod -v a+wt $KFS/sources

#download files
wget --input-file=res/wget-list --continue --directory-prefix=$KFS/sources

# echo "now you need to put the md5sums file in $LFS/sources directory"
# read -p "press key to continue" key
# if [ $(find $LFS/sources/md5sums | wc -l) -eq 1 ]; then
#     echo "md5sums found"
# else
#     echo "md5sums not found in $LFS/sources"
#     exit 1
# fi

# pushd $LFS/sources
# md5sum -c md5sums
# popd

echo "if ok, execute script4.sh else, ignore or try to fix it!"
