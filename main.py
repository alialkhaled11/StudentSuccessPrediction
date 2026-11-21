
import os
import pandas as pd
import pg8000.dbapi

from sklearn.tree import DecisionTreeClassifier
from sklearn.model_selection import train_test_split

from sklearn.metrics import (
    accuracy_score,
    precision_score,
    recall_score,
    f1_score,
    confusion_matrix
)


# PostgreSQL baglantisi
conn = pg8000.dbapi.connect(
    host="student-postgres",
    port=5432,
    database="student_db",
    user="student",
    password=os.environ["DB_PASSWORD"]
)

cursor = conn.cursor()

# Verileri veritabanindan oku
cursor.execute("""
    SELECT study_hours, attendance, previous_grade, passed
    FROM students
""")

rows = cursor.fetchall()

df = pd.DataFrame(
    rows,
    columns=[
        "study_hours",
        "attendance",
        "previous_grade",
        "passed"
    ]
)

print("Toplam ogrenci sayisi:", len(df))


# Veri on isleme: eksik veri kontrolu
print("\nEKSIK VERI KONTROLU")
print(df.isnull().sum())

# Eksik verileri temizle
df = df.dropna()

print("Temizleme sonrasi ogrenci sayisi:", len(df))


# Giris ve hedef degiskenleri
X = df[["study_hours", "attendance", "previous_grade"]]
y = df["passed"]

# Verileri egitim ve test olarak ayir
X_train, X_test, y_train, y_test = train_test_split(
    X,
    y,
    test_size=0.2,
    random_state=42,
    stratify=y
)

print("Egitim verisi:", len(X_train))
print("Test verisi:", len(X_test))

# Modeli egit
model = DecisionTreeClassifier(random_state=42)
model.fit(X_train, y_train)

# Test verisiyle tahmin yap
y_pred = model.predict(X_test)

print("\nMODEL PERFORMANSI")
print("Accuracy:", round(accuracy_score(y_test, y_pred), 4))
print("Precision:", round(precision_score(y_test, y_pred, zero_division=0), 4))
print("Recall:", round(recall_score(y_test, y_pred, zero_division=0), 4))

print("F1-score:", round(f1_score(y_test, y_pred, zero_division=0), 4))

print("\nKARISIKLIK MATRISI")
print(confusion_matrix(y_test, y_pred))


# Yeni ogrenci tahmini
new_student = pd.DataFrame(
    [[5, 80, 70]],
    columns=["study_hours", "attendance", "previous_grade"]
)

prediction = int(model.predict(new_student)[0])

print(
    "\nYeni ogrenci tahmini:",
    "GECTI" if prediction == 1 else "KALDI"
)

# Tahmini PostgreSQL'e kaydet
cursor.execute("""
    INSERT INTO predictions (
        study_hours,
        attendance,
        previous_grade,
        predicted_pass
    )
    VALUES (%s, %s, %s, %s)
""", (5, 80, 70, prediction))

conn.commit()

print("Tahmin veritabanina basariyla kaydedildi!")

cursor.close()
conn.close()
