
function nodeUpdate
{
  sudo npm install npm -g
}

function nodeTrash
{
  sudo rm /usr/local/bin/npm
  sudo rm /usr/local/share/man/man1/node.1
  sudo rm /usr/local/lib/dtrace/node.d
  sudo rm -rf ~/.npm
  sudo rm -rf ~/.node-gyp
  sudo rm /opt/local/bin/node
  sudo rm /opt/local/include/node
  sudo rm -rf /opt/local/lib/node_modules
}

//yo, grunt, bower, iojs, express, n (version manager), nodemon
