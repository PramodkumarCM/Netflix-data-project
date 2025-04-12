# Netflix-data-project
This end-to-end data analytics project focuses on uncovering key insights from Netflix's movie data, including genre popularity, ratings trends, release patterns, and global availability. It combines data engineering, database management, and business intelligence techniques using Python, SQL, and Power BI.

Netflix-Analytics-Project/
│
├── data/
│   └── netflix_titles.csv            # Original dataset
│
├── notebooks/
│   └── Netflix data analysis project.ipynb  # Jupyter Notebook with data cleaning and EDA
│
├── sql/
│   └── schema.sql                    # SQL schema creation scripts
│
├── dashboard/
│   └── power_bi_dashboard.pbix      # Power BI dashboard file
│
├── README.md                        # Project description and setup
└── requirements.txt                 # Python dependencies

# Step 1
1. Data Cleaning & Preparation (Python)
* Load the dataset using Pandas.
* Remove duplicates and handle missing/null values.
* Standardize column names and data formats (e.g., genres, ratings).
* Extract relevant features: year, type, duration, etc.
* Save the cleaned DataFrame for SQL insertion.

This project explores and analyzes Netflix data using Python libraries such as Pandas, NumPy, and SQLite3. The goal is to clean, process, and derive insights from the dataset, which includes information about Netflix shows and movies.

🧰 Technologies Used
Python: Primary language for data analysis.

Pandas: For loading, cleaning, and manipulating data.

NumPy: For numerical computations.

SQLite3: For storing and querying the data using SQL.

Jupyter Notebook: Interactive development and analysis environment.

📂 Dataset
Source: netflix data C W project.csv

Description: Contains metadata about TV shows and movies available on Netflix, including title, genre, cast, director, release year, and more.

📌 Key Steps
Library Import and Setup

import pandas as pd
import numpy as np
import sqlite3
import warnings
warnings.filterwarnings("ignore")
Load essential libraries.

Suppress warnings for cleaner output.

Data Loading

data = pd.read_csv("netflix data C W project.csv")
df = pd.DataFrame(data)
Load the CSV dataset using pandas.

Store it in a DataFrame for analysis.

(Further steps like cleaning, analysis, visualization, and SQL integration would be described once we analyze the full notebook.)

📈 Potential Analysis Ideas
Count of shows vs movies

Most common genres

Trend of releases over the years

Top-rated or most frequent directors/actors

SQL-based queries for advanced filtering

📝 To-Do
 Add data cleaning steps

 Perform exploratory data analysis (EDA)

 Integrate SQLite queries

 Add markdown documentation in the notebook

📁 How to Run
Clone the repo

Ensure you have Python and Jupyter installed

Install dependencies:

pip install pandas numpy
Run the Jupyter Notebook and follow the analysis.



# Step 2
Data Loading

Read the CSV file using pandas.

Convert it into a DataFrame for further analysis.

Initial Exploration

Basic exploration of rows, columns, data types, and missing values.

Data Cleaning

Handling null values

Standardizing column formats

Parsing date fields

Exploratory Data Analysis (EDA)

Distribution of titles over years

Yearly release trends

Most Popular genres and ratings

SQL Integration

Store the dataset in a SQLite database.

Run SQL queries to extract deeper insights 
Distribution of titles over years

Yearly release trends

Most Popular genres and ratings
# Step 3
📊 Dashboard Overview
The Power BI report consists of multiple pages with well-structured visuals:

2. Yearly Content Trend
Line chart showing the number of releases per year.

4. Popular Genres
   CARD content by genre.

5. Rating Distribution
Visual Table showing how content is classified by audience maturity 
