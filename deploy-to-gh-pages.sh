# See https://medium.com/@nthgergo/publishing-gh-pages-with-travis-ci-53a8270e87db
set -o errexit

# config
git config --global user.email "developerdizzle+travis@gmail.com"
git config --global user.name "Travis CI"

# build (CHANGE THIS)
npm run build

# deploy
cd client/dist
git init
git add .
git commit -m "[travis] Deploy to Github Pages"
git push --force --quiet "https://${GITHUB_TOKEN}@$github.com/developerdizzle/node-starter.git" master:gh-pages > /dev/null 2>&1