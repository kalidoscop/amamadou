from flask import Flask, render_template

app = Flask(__name__)

def somme(a,b):
     return a+b

@app.route("/")
def hello_world(): 
    return "Hello, World!" 


@app.route('/home')
def home():
    return render_template('index.html')

@app.route("/")
def summ(): 
    return "" + somme(5,5)

 

if __name__ == '__main__':
	app.run(host='0.0.0.0', port=8000)