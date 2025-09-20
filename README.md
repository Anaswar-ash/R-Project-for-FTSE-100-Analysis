# R-Project-for-FTSE-100-Analysis
R Project for FTSE 100 Analysis from 2000-2025.
# FTSE 100 Historical Trend Analysis

## 📈 Project Overview

This project analyzes the historical performance of the FTSE 100 index from 2000 to 2025 using an R script. The analysis visualizes the long-term trend of the index and also calculates and displays the annual returns to provide a deeper insight into its year-over-year performance.

**Author**: Ash

## 💾 Data

The dataset used for this analysis is `chart (1).csv`, which contains monthly data for the FTSE 100 index. The data spans from the year 2000 to 2025.

**Data Source**: [curvo.eu](https://curvo.eu)

## 🛠️ Tools and Libraries

* **R**: The programming language used for the analysis.
* **Tidyverse**: A collection of R packages for data science, used here for data manipulation and visualization (`ggplot2`, `dplyr`).
* **lubridate**: For easy handling of date-time data.
* **zoo**: For calculating the moving average.

## 🚀 How to Run the Project

1.  **Prerequisites**: Make sure you have R and RStudio or VS Code with the R extension installed.
2.  **Install R Packages**: If you haven't already, install the necessary packages by running the following commands in your R console:
    ```R
    install.packages("tidyverse")
    install.packages("lubridate")
    install.packages("zoo")
    ```
3.  **Run the analysis script**: Open the `analysis.R` script in RStudio or VS Code and run it. The script will generate two plots:
    * `ftse_100_historical_trend.png`: Shows the overall trend of the FTSE 100 index.
    * `ftse_100_annual_returns.png`: A bar chart of the annual percentage returns.

## 📊 Results and Visualizations

### FTSE 100 Historical Trend

This plot shows the fluctuation of the FTSE 100 index over the years. The dotted red line represents the 12-month moving average, which helps to visualize the underlying trend more clearly.

*(Insert your `ftse_100_historical_trend.png` image here after you run the script)*

### FTSE 100 Annual Returns

This bar chart provides a clear view of the market's performance each year, showing which years were positive (green) and which were negative (red).

*(Insert your `ftse_100_annual_returns.png` image here after you run the script)*

## R Code

Here is the R script used for the analysis:

```R
# Load necessary libraries
library(tidyverse)
library(lubridate)
library(zoo)

# ... (rest of the R code from analysis.R) ...