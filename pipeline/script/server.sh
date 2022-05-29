#!/bin/bash

# Set the port
PORT=8081

# Stop any program currently running on the set port
echo 'preparing port' $PORT '...'

# switch directories
cd build/web/

# Start the server
echo 'Server starting on port' $PORT '...'
python3 -m http.server $PORT