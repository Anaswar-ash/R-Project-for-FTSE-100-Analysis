# Load necessary libraries
library(tidyverse)
library(lubridate)
library(zoo)

# Load the dataset
# Make sure your CSV file is in the same directory as this script
ftse_data <- read.csv("chart (1).csv")

# --- Data Cleaning and Preparation ---

# Rename columns for easier use.
# Note: Check your CSV file for the exact column names and adjust if necessary.
colnames(ftse_data) <- c("Date", "FTSE_100")

# Convert the 'Date' column to a date object.
# The format "%m/%Y" assumes your dates are in "month/year" format (e.g., "04/2000"). # nolint: line_length_linter.
# If your date format is different, you will need to change this.
ftse_data$Date <- parse_date_time(ftse_data$Date, orders = "my")

# --- Analysis & Visualization ---

# 1. Historical Trend Plot
ggplot(ftse_data, aes(x = Date, y = FTSE_100)) +
  geom_line(color = "blue") +
  labs(
    title = "FTSE 100 Historical Trend (2000-2025)",
    subtitle = "with 12-Month Moving Average",
    x = "Date",
    y = "FTSE 100 Index"
  ) +
  theme_minimal() +
  # Add a 12-month moving average to smooth out the trend
  geom_line(aes(y = rollmean(FTSE_100, 12, fill = NA)), color = "red", linetype = "dashed") # nolint: line_length_linter.

# Save the plot
ggsave("ftse_100_historical_trend.png", width = 10, height = 6)

# 2. Annual Returns Analysis (Something extra!)
# Calculate annual returns
annual_returns <- ftse_data %>%
  group_by(year = year(Date)) %>%
  summarise(
    yearly_return = (last(FTSE_100) - first(FTSE_100)) / first(FTSE_100) * 100
  )

# Plot annual returns
ggplot(annual_returns, aes(x = year, y = yearly_return, fill = yearly_return > 0)) + # nolint: line_length_linter.
  geom_bar(stat = "identity") +
  scale_fill_manual(values = c("red", "green"), guide = "none") +
  labs(
    title = "FTSE 100 Annual Returns",
    x = "Year",
    y = "Annual Return (%)"
  ) +
  theme_minimal()

# Save the annual returns plot
ggsave("ftse_100_annual_returns.png", width = 10, height = 6)

print("Analysis complete. Plots saved as 'ftse_100_historical_trend.png' and 'ftse_100_annual_returns.png'") # nolint: line_length_linter.