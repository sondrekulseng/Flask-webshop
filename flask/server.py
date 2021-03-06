import os
from flask import Flask, render_template, jsonify, request, abort
from flask_mysqldb import MySQL
from werkzeug.utils import secure_filename
from prometheus_client import start_http_server, Counter

app = Flask(__name__, template_folder='static/')

metrics_port = 5001
# define metrics for prometheus
index_count = Counter('index_count', 'Front page views')
search_count = Counter('search_count', 'Search products requests')
product_count = Counter('product_count', 'Get product requests')
upload_count = Counter('upload_count', 'Image upload')
product_add_count = Counter('product_add_count', 'New product added')

# db config
app.config['MYSQL_HOST'] = 'db'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'root'
app.config['MYSQL_DB'] = 'webshop'

# file upload
app.config['UPLOAD_FOLDER'] = '/media'
ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg', 'gif', 'tif', 'webp'}

mysql = MySQL(app)

# index page
@app.route('/')
def index():
    index_count.inc()
    return render_template("index.html")

# admin page
@app.route('/admin')
def admin():
    return render_template("admin.html")

# cart page
@app.route('/cart')
def cart():
    return render_template("cart.html")

# get product by ID
@app.route('/api/product/get/<int:id>')
def get(id):
    product_count.inc()
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM product WHERE productID = %s", [id])
    myresult = cur.fetchall()
    return jsonify(myresult)

# select random products
@app.route('/api/product/get/random')
def getRandom():
    id = request.args.get('id')
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM product WHERE productID != %s ORDER BY RAND() LIMIT 3", [id])
    myresult = cur.fetchall()
    return jsonify(myresult)

# get all products
@app.route('/api/product/get')
def getAll():
    order = int(request.args.get('order'))
    cur = mysql.connection.cursor()
    if order == 0:
        cur.execute("SELECT * FROM product ORDER BY price ASC")
    elif order == 1:
        cur.execute("SELECT * FROM product ORDER BY price DESC")
    elif order == 2:
        cur.execute("SELECT * FROM product ORDER BY name ASC")
    elif order == 3:
        cur.execute("SELECT * FROM product ORDER BY productID DESC")
    myresult = cur.fetchall()
    return jsonify(myresult)

# search products
@app.route('/api/product/search')
def search():
    search_count.inc()
    keyword = "%"+request.args.get('keyword')+"%"
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM product WHERE name LIKE %s LIMIT 7", [keyword])
    myresult = cur.fetchall()
    return jsonify(myresult)

@app.route('/api/auth/admin', methods = ['POST', 'GET'])
def login():
    username = request.form.get('username')
    pwd = request.form.get('pwd')
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM adminLogin WHERE username = %s AND pwd = %s", [username, pwd])
    myresult = cur.fetchall()
    return jsonify(myresult)

# Snippet from: https://flask.palletsprojects.com/en/1.1.x/patterns/fileuploads/
def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

@app.route('/api/media/upload', methods=['POST', 'GET'])
def upload():
    if request.method == "POST":
        # file upload
        uploaded_file = request.files['file']
        filename = secure_filename(uploaded_file.filename)
        if filename != '' and allowed_file(filename):
            upload_count.inc()
            absolute_path = os.path.abspath("static/media/"+filename)
            uploaded_file.save(absolute_path)
            return filename
        else:
            abort(500)


@app.route('/api/product/add', methods=['POST', 'GET'])
def add():
    if request.method == "POST":
        product_add_count.inc()
        name = request.form.get("name")
        short_desc = request.form.get("short_desc")
        long_desc = request.form.get("long_desc")
        price = request.form.get("price")
        img = request.form.get("img")
        print(img)
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO product (name, short_desc, long_desc, price, img) VALUES (%s, %s, %s, %s, %s)", [name, short_desc, long_desc, price, img])
        mysql.connection.commit()
        return "ok"

if __name__ == "__main__":
    start_http_server(metrics_port)
    app.run(host ='0.0.0.0', port = 5000, debug = False, ssl_context=('cert/cert.pem', 'cert/key.pem'))
