# NETFLIX STOCK DATA VISUALIZATION PROJECT

Welcome to the Netflix Stock Data Analysis and Visualization project. This project focuses on analyzing Netflix’s stock performance over the year 2017. The goal is to gain meaningful insights into the company’s market behavior by visualizing stock prices, earnings, and comparisons with broader market indicators.

## TABLE OF CONTENTS
- [Introduction](#introduction)
- [Data Source](#data-source)
- [Objectives](#objectives)
- [Methodology](#methodology)
- [Key Questions Addressed](#key-questions-addressed)
- [Conclusion](#conclusion)

## INTRODUCTION

This project simulates the role of a data visualization developer at Yahoo Finance. You will work with various datasets to visually explore Netflix’s stock performance. By presenting trends and comparisons with the Dow Jones Industrial Average, the analysis helps assess Netflix's market position during 2017.

## DATA SOURCE

The datasets used in this project include:
- Netflix stock data (`NFLX.csv`)
- Dow Jones Industrial Average stock data (`DJI.csv`)
- Netflix daily data by quarter (`NFLX_daily_by_quarter.csv`)

These datasets are available in the project repository.

## OBJECTIVES

- Analyze and visualize the distribution of Netflix stock prices over the year.
- Compare actual vs. estimated earnings per share across quarters.
- Visualize Netflix’s revenue and earnings over time.
- Compare Netflix stock prices with a major market benchmark (DJIA).

## METHODOLOGY

1. **Data Exploration and Cleaning**
   - Read and explore all datasets using pandas.
   - Remove any unnecessary columns or rows.
   - Format data types (dates, numbers) as needed.

2. **Quarterly Earnings Analysis**
   - Plot actual vs. estimated EPS for each quarter.
   - Highlight overperforming or underperforming quarters.

3. **Stock Price Distribution**
   - Use violin and box plots to visualize daily stock price distributions by quarter.

4. **Revenue vs Earnings Comparison**
   - Generate grouped bar charts showing revenue and earnings across quarters.

5. **Market Comparison**
   - Line plot of Netflix stock vs DJIA to evaluate performance trends.

## KEY QUESTIONS ADDRESSED

1. How did Netflix perform across quarters in 2017?
2. Did Netflix consistently exceed earnings expectations?
3. How does Netflix's stock performance compare to the DJIA?
4. What insights can we gain from daily stock price distributions?

## CONCLUSION

The Netflix stock analysis provides valuable insights into its financial and market behavior throughout 2017. Through clear and interactive visualizations, we gain a better understanding of earnings consistency, investor expectations, and how the stock performed relative to market trends.

---

### PROJECT STRUCTURE

- `Project_Netflix.ipynb`: Jupyter Notebook containing the full analysis and plots.
- `netflix_stock.jpg`: Visual asset used for branding (optional).
- `NFLX.csv` / `DJI.csv` / `NFLX_daily_by_quarter.csv`: Datasets used in the analysis.