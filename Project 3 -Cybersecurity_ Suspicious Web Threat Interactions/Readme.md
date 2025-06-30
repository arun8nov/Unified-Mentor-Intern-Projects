# Cybersecurity: Suspicious Web Threat Interactions

## Project Overview
This project analyzes web traffic data to identify suspicious interactions and potential cyber threats. Using data exploration, visualization, and machine learning models, we detect anomalous patterns and classify network interactions as normal or suspicious.

## Dataset
The dataset used in this project, `CloudWatch_Traffic_Web_Attack.csv`, contains various attributes related to web traffic, such as IP addresses, timestamps, bytes transferred, and detection types.

### Key Features:
- **Time-based attributes** (`creation_time`, `end_time`, `time`) to analyze session durations.
- **Traffic attributes** (`bytes_in`, `bytes_out`, `dst_port`) to assess network usage.
- **Source attributes** (`src_ip`, `src_ip_country_code`) to track originating traffic locations.
- **Detection labels** (`detection_types`) to identify attack patterns.

## Data Processing & Exploration
1.  **Handling Missing & Duplicate Data**
    - Checked for null values and duplicates.
    - Converted time-based columns to datetime format.
   
2.  **Exploratory Data Analysis (EDA)**
    - Visualized unique values in different columns.
    - Analyzed traffic patterns by country.
    - Examined `bytes_in` and `bytes_out` variations over time.
    - Created heatmaps of data distribution.

## Feature Engineering
- **Derived `duu_time` (session duration)** from start and end timestamps.
- **Standardized numerical features** using `StandardScaler`.
- **One-hot encoded categorical features** (source country codes).

## Machine Learning Models
### K-Nearest Neighbors (KNN)
- Features: `bytes_in`, `bytes_out`, `dst_port`
- Evaluated using cross-validation.
- Assessed train vs test accuracy.

### Random Forest Classifier
- Features: `bytes_in`, `bytes_out`, `SC_duu_time`
- Target: `suspicious` (binary label derived from `detection_types`)
- Model trained on processed data.
- Achieved accuracy evaluation and classification report.

## Results
- **KNN Model**: Evaluated cross-validation accuracy and performance metrics.
- **Random Forest Model**: Provided classification insights and accuracy scores for anomaly detection.

## How to Run
1. Ensure you have Python and Jupyter Notebook installed.
2. Install the necessary libraries: pandas, numpy, matplotlib, seaborn, and scikit-learn.
   ```bash
   pip install pandas numpy matplotlib seaborn scikit-learn
   ```
3. Place the `CloudWatch_Traffic_Web_Attack.csv` file in the same directory as the notebook.
4. Open and run the `Cyber_Suspicious Web Threat.ipynb` notebook.
