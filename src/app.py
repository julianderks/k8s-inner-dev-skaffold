from flask import Flask, jsonify
import os
import redis

app = Flask(__name__)

# Connect to Redis
redis_host = os.getenv("REDIS_HOST", "localhost")
redis_port = int(os.getenv("REDIS_PORT", 6379))
redis_client = redis.Redis(host=redis_host, port=redis_port, decode_responses=True)

# Check if environment variables should be printed
print_env = True

@app.route("/")
def home():
    # Increment a counter in Redis and return it
    redis_client.incr("visits")
    visit_count = redis_client.get("visits")

    # Conditionally include environment variables based on PRINT_ENV flag
    response = {
        "message": "Hello from the Python Microservice!",
        "visits": visit_count,
    }
    
    if print_env:
        # Include all environment variables if PRINT_ENV is true
        env_vars = {key: value for key, value in os.environ.items()}
        response["environment"] = env_vars
    
    return jsonify(response)


if __name__ == "__main__":
    port = int(os.getenv("PORT", 5000))
    app.run(host="0.0.0.0", port=port)
