# Electric Vehicle Sales Analysis in India

A Comprehensive Analysis of EV Sales Trends, Regional Performance, and Market Opportunities.

## 📌 Overview

This project analyzes electric vehicle (EV) sales data across Indian states from 2014 to 2023. It identifies growth trends, regional disparities, and market opportunities through data visualization, regression modeling, and forecasting.

## Key Objectives:

* Identify yearly/monthly sales trends.
* Compare state-wise EV adoption rates.
* Analyze vehicle category performance.
* Forecast future sales and provide actionable insights.

## 🔍 Key Insights

### 1. Sales Trends

* **Yearly Growth**: Sales surged from 14,200 units (2014) to 1,140,800 units (2023) – an 80x increase.
* **Peak Month**: December recorded the highest sales (205,458 units), likely due to year-end incentives.
* **Forecast**: Sales expected to reach ~1.64 million units by 2029 (Prophet model).

### 2. Regional Performance

* **Top States**:
    * Maharashtra (265,125 units)
    * Gujarat (192,450 units)
    * Karnataka (176,800 units)
* **Underperforming States**: Bihar, Jharkhand, and Telangana (<10,000 units).

### 3. Vehicle Categories

* **Dominant Segment**: Two-wheelers (54.5% of total sales).
* **Untapped Potential**: 27 vehicle classes (e.g., cargo vehicles) had zero sales.

### 4. Model Performance

* **Regression Analysis**:
    * R² Score: 0.86 (strong correlation).
    * MAE: 29.4 (average prediction error).

## 🛠️ Technical Details

### Tools & Libraries

* **Python**: Pandas, NumPy, Matplotlib, Seaborn.
* **Machine Learning**: Scikit-learn (Linear Regression).
* **Forecasting**: Facebook Prophet.

### Data Processing

* Removed zero-sales entries for accurate analysis.
* Encoded categorical variables (State, Vehicle Class) for regression.

### Visualizations

* **Heatmaps**: Highlighted state-year sales trends.
* **Bar Charts**: Compared state/category performance.
* **Forecast Plot**: 5-year sales trajectory with confidence intervals.

## 🚀 How to Use

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/your-username/ev-sales-analysis.git](https://github.com/your-username/ev-sales-analysis.git)
    ```
2.  **Install the dependencies:**
    ```bash
    pip install -r requirements.txt
    ```
3.  **Run the Jupyter Notebook:**
    ```bash
    jupyter notebook "EV-Sales Code file.ipynb"
    ```

## Data Source

The dataset used in this analysis is `Electric Vehicle Sales by State in India.csv`.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.