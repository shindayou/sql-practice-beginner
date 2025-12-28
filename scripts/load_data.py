import pandas as pd
import sqlite3

df = pd.read_csv("data/cleaned_titanic.csv")

conn = sqlite3.connect("titanic.db")

df.to_sql("titanic", conn, if_exists="replace", index=False)

conn.close()

print("Data loaded successfully.")
