# !/bin/bash
docker run -d -p 5000:5000 --name flask flask
sleep 5
num1 =5
num2 = 10
expected_sum = $((num1 +num2))
response = $ (curl ""http://localhost:5000/add?num1=num1&num2=num2")
if [["$response" == "$expected_sum "]]; then 
echo "test passed: $num1 + $num2 = $response(expected $expected_sum)"
Docker stop flask
docker rm flask
exit 0
else 
echo "Test failed : Expected $expected_sum ,but got $response"
Docker stop flask
docker rm flask
exit 1
fi
