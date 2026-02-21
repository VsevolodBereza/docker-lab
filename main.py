from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello():
    return 'Hello world!'

@app.route('/about')
def about():
    return 'This app is powered by Docker!'

@app.route('/info')
def info():
    return 'Some important information!'

if __name__ == '__main__':
    app.run()