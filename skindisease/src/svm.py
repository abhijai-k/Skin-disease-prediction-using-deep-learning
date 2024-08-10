import joblib
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder, StandardScaler
from sklearn.svm import SVC

a = pd.read_csv(r"C:\Users\akhil\OneDrive\Desktop\skincancer\src\static\features.csv")
X = a[ ['energy','homogeneity','dissimilarity','correlation','contrast']].values
Y = a[['label']].values

label_encoder = LabelEncoder()
Y = label_encoder.fit_transform(Y)
X = StandardScaler().fit_transform(X)


X_train , X_test, y_train, y_test = train_test_split(X,Y)
clf = SVC(C=1.0, kernel='rbf').fit(X_train,y_train)
joblib.dump(clf, 'filename.pkl')

knn_from_joblib = joblib.load('filename.pkl')
knn_from_joblib.predict(X_test)

print(X)