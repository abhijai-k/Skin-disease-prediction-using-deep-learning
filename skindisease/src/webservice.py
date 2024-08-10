import joblib
from flask import *
from sklearn.svm import SVC

from src.dbconnection import *
import os
from werkzeug.utils import secure_filename
app=Flask(__name__)




@app.route('/login',methods=['POST'])
def login():

    username=request.form['username']
    password=request.form['password']

    qry="select * from login where username=%s and password=%s and type='user'"
    val=(username,password)
    res=selectone(qry,val)

    if res is None:
        return jsonify({'task':'invalid'})

    else:
        id= res['lid']
        return jsonify({'task':'success','lid':id})




@app.route('/addimage',methods=['post','get'])
def addimage():

    image = request.files['file']
    fname = secure_filename(image.filename)
    image.save(os.path.join('static/upload', fname))

    from sklearn.ensemble import RandomForestClassifier

    import numpy as np
    from skimage import io, color, img_as_ubyte

    from skimage.feature import greycomatrix, greycoprops
    from sklearn.metrics.cluster import entropy
    #
    rgbImg = io.imread(r"C:\Users\akhil\OneDrive\Desktop\skincancer\src\static\upload\\" +fname)
    # rgbImg = io.imread(r"C:\Users\akhil\OneDrive\Desktop\skincancer\src\static\archive\train\Acne and Rosacea Photos\07Acne081101.jpg")
    grayImg = img_as_ubyte(color.rgb2gray(rgbImg))

    distances = [1, 2, 3]
    angles = [0, np.pi / 4, np.pi / 2, 3 * np.pi / 4]
    properties = ['energy', 'homogeneity', 'dissimilarity', 'correlation', 'contrast']

    glcm = greycomatrix(grayImg,
                        distances=distances,
                        angles=angles,
                        symmetric=True,
                        normed=True)

    feats = np.hstack([greycoprops(glcm, 'energy').ravel() for prop in properties])
    feats1 = np.hstack([greycoprops(glcm, 'homogeneity').ravel() for prop in properties])
    feats2 = np.hstack([greycoprops(glcm, 'dissimilarity').ravel() for prop in properties])
    feats3 = np.hstack([greycoprops(glcm, 'correlation').ravel() for prop in properties])
    feats4 = np.hstack([greycoprops(glcm, 'contrast').ravel() for prop in properties])

    k = np.mean(feats)
    l = np.mean(feats1)
    m = np.mean(feats2)
    n = np.mean(feats3)
    o = np.mean(feats4)
    ar = []
    ar.append(k)
    ar.append(l)
    ar.append(m)
    ar.append(n)
    ar.append(o)
    arr = []
    test_val = np.array(ar)
    arr.append(test_val)

    import pandas as pd
    a = pd.read_csv(r"C:\Users\akhil\OneDrive\Desktop\skincancer\src\static\features.csv")

    attributes = a.values[1:, 0:5]
    labels = a.values[1:, 5]
    #
    # rf = RandomForestClassifier(n_estimators=100)
    # rf.fit(attributes, labels)
    rf = SVC(C=1.0, kernel='rbf').fit(attributes, labels)
    pred = rf.predict(arr)
    print(arr[0])
    print(pred[0], "-----%%%%%--------------")


    return jsonify({'task': 'success',"res":pred[0],"fn":fname})



@app.route('/viewimage',methods=['post'])
def viewimage():
    d=request.form['disease']
    qry="SELECT * FROM remedy where disease=%s"
    res=selectall2(qry,d)
    return jsonify(res)








@app.route("/userreg",methods=['post'])
def userreg():
    name=request.form['name']
    place=request.form['place']
    post=request.form['post']
    email = request.form['email']
    phone = request.form['phone']
    username=request.form['username']
    password=request.form['password']

    qry = "INSERT INTO `login` VALUES(NULL,%s,%s,'user')"
    id = iud(qry,(username,password))

    qry = "INSERT INTO `user` VALUES(null,%s,%s,%s,%s,%s,%s)"
    iud(qry,(str(id) ,name,place,post,phone,email))
    return jsonify({'task': 'valid'})


app.run(port='5000',host='0.0.0.0')