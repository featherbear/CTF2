#!/bin/sh
cd "$(dirname "$0")"

# Update repo and fetch submodules
git pull
git submodule update --init --recursive

# Generate updater
cat > ./update.sh << :EOF
#!/bin/sh

cd "\$(dirname "\$0")"
git pull
git submodule update --init --recursive
git submodule foreach git pull
:EOF
chmod a+x ./update.sh

# Wow magical disappearing file!
rm "$0"
