# %%
import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder
from sklearn.ensemble import RandomForestClassifier
from sklearn.impute import SimpleImputer

# %%
# 读取CSV数据
df = pd.read_csv('./scale_result.csv')

# %%
# 分离特征和标签
X = df.drop(["diagnosis_label"], axis = 1)
y = df['diagnosis_label']

# %%
# 处理标签
le = LabelEncoder()
y = le.fit_transform(y)

# %%
# 处理缺失值
imputer = SimpleImputer(strategy='mean')
X = imputer.fit_transform(X)

# %%
# 分割训练集和测试集
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# %%
# 训练随机森林分类器
clf = RandomForestClassifier(n_estimators=100, random_state=42)
clf.fit(X_train, y_train)

# %%
def predict_diagnosis(
        patient_data,
        model: RandomForestClassifier = clf,
        label_encoder: LabelEncoder = le,
        imputer: SimpleImputer = imputer
        ):
    # 处理输入数据的缺失值
    patient_data = imputer.transform(patient_data)

    # 预测疾病类型
    prediction = model.predict(patient_data)
    prediction_proba = model.predict_proba(patient_data)

    # 获取预测标签
    predicted_label = label_encoder.inverse_transform(prediction)

    # 获取预测概率
    # probabilities = dict(zip(label_encoder.classes_, prediction_proba[0]))
    probabilities = [
        sorted(
            zip(label_encoder.classes_, probs),  # 组合类别和概率
            key=lambda x: x[1],  # 按概率排序
            reverse=True  # 降序
        )
        for probs in prediction_proba
    ]

    return predicted_label[0], probabilities[0]

# %%
if __name__ == "__main__":
    # [12.0,2.0,14,30,0.0,21.5,2.0,2.0]
    new_patient = np.array([[7.0, 0.0, 13, 20, np.nan, 25.0, 0.0, 2.0]])
    predicted_label, probabilities = predict_diagnosis(new_patient, clf, le, imputer)

    print(f"预测的疾病类型: {predicted_label}")
    print("\n各疾病类型的概率:")
    for disease, prob in probabilities:
        print(f"{disease}: {prob:.2f}")
# %%
