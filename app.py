# Simple web application using Flask framework
from flask import Flask

import os

HOSTNAME = os.getenv('HOSTNAME', 'Flask')
app = Flask(__name__)

@app.route("/")
def hello_world():
    return f"<p>Hello from {HOSTNAME}</p>"

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=8080)