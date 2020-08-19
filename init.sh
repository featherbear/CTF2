#!/bin/sh

cd "$(dirname "$0")"

git submodule update --init

cat > ./update.sh << :EOF
#!/bin/sh

cd '\$(dirname "\$0")'
git submodule foreach git pull origin master
:EOF
chmod a+x ./update.sh

