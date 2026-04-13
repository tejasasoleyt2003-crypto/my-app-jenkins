from flask import Flask, render_template, request

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/login', methods=['POST'])
def login():
    username = request.form.get('username')
    password = request.form.get('password')

    if username == "admin" and password == "1234":
        return "Login Successful ✅"
    else:
        return "Invalid Credentials ❌"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
