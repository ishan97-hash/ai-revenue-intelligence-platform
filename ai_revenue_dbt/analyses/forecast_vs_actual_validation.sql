SELECT
  m.YearMonth,
  m.Actual_Revenue,
  f.yhat AS Forecast_Revenue,
  ABS(m.Actual_Revenue - f.yhat) AS abs_error,
  SAFE_DIVIDE(ABS(m.Actual_Revenue - f.yhat), m.Actual_Revenue) AS pct_error
FROM monthly_revenue m
JOIN revenue_forecast f
  ON m.YearMonth = f.YearMonth
ORDER BY YearMonth;
