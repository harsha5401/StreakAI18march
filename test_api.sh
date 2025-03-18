#!/bin/bash
docker run -d -p 5000:5000 --name flask_app flask_app_image
sleep 5
response=$(curl -s "http://localhost:5000/add?num1=5&num2=3")
if [[ "$response" == "8" ]]; then
    echo "Test passed!"
    docker stop flask_app
    docker rm flask_app
    exit 0
else
    echo "Test failed: Expected 8 but got $response"
    docker stop flask_app
    docker rm flask_app
    exit 1
fi
