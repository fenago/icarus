#!/bin/bash
# update the key in index_server.py
# sudo apt install xsel

# start backend index server
python ./index_server.py &
echo "index_server running..."

# wait for the server to start - if creating a brand new huge index, on startup, increase this further
sleep 60

# start the flask server
python ./flask_demo.py &

# assumes you've ran npm install already (dockerfile does this during build)
# cd react_frontend && npm run build && serve -s build
cd react_frontend && npm install && npm run build && npm install -g serve && serve -s build
