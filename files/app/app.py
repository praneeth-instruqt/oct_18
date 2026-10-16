from flask import Flask, jsonify
import os

app = Flask(__name__)

@app.route("/")
def home():
    return """
    <html>
    <head><title>Hello from Cloud Run</title></head>
    <body style="font-family: sans-serif; text-align: center; padding: 50px;">
        <h1>Hello from Google Cloud Run!</h1>
        <p>This app was built and deployed as part of an Instruqt lab.</p>
        <p>Container is running on port {port}.</p>
    </body>
    </html>
    """.format(port=os.environ.get("PORT", 8080))

@app.route("/health")
def health():
    return jsonify(status="healthy"), 200

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 8080))
    app.run(host="0.0.0.0", port=port)
