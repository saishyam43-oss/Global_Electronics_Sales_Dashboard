# 📊 Global Electronics: Retail Sales Operations Dashboard

> *A complete end-to-end retail analytics project built using SQL and Power BI, focused on uncovering performance trends, product profitability, and customer retention insights.*

---

<div align="center">

<img src="Images/Logo_GE.png" alt="Global Electronics Logo" width="150"/>

<h1>
  $${\color{green}Global \space \color{yellow}Electronics}$$
</h1>
<h3>Retail Sales Operations Dashboard</h3>

</div>

### 1. Client Background & Project Context

Global Electronics is a (fictional) multinational retailer specializing in high-end consumer electronics. Founded in 2010, the company expanded rapidly from its North American roots, establishing a significant physical presence across Europe and Australia with over 70 stores, complemented by a robust e-commerce ("Online") platform.

For years, GE was a market leader, but following a record-breaking year in 2019, the company began to see a significant and worrying decline in sales. Leadership was unable to diagnose the root cause: was this a market-wide (e.g., pandemic) problem, a failure in customer retention, a shift in product demand, or regional underperformance?

The primary stakeholders—the **VP of Sales** and the **Director of Marketing**—initiated this project to transform 5+ years (2016-2021) of raw, messy, and siloed transactional data into a unified, reliable, and actionable analytics dashboard to guide their recovery strategy.

---

### 2. Business Problem & Objective

The core business problem was a **lack of visibility**. The leadership team was "flying blind" and could not answer critical, data-driven questions:

* **Why** did our strong sales growth reverse after 2019?
* **Are** we failing to acquire new customers, or are we losing our loyal ones?
* **Which** products and categories are our true profit drivers, and which are "cash cows" (high revenue, low margin)?
* **Where** are our most (and least) efficient stores and regions?

The **objective** of this project was to clean, model, and analyze five years of data (from 5 tables: `Sales`, `Products`, `Customers`, `Stores`, `Exchange Rates`) to build a "single source of truth" dashboard. This tool would diagnose the root causes of the sales decline and identify the most valuable opportunities for growth.

---

### 3. North-Star Metrics (Key Business Goals)

To provide actionable answers, the analysis was focused on a set of "North-Star" KPIs that measure the complete health of the business:

* **`Total Revenue & YoY Growth`**: To measure top-line performance.
* **`Total Profit & Profit Margin %`**: To measure bottom-line efficiency.
* **`New Customer Acquisition (YTD)`**: To measure market expansion.
* **`Customer Retention (Recency)`**: To measure customer loyalty and churn.
* **`Customer Lifetime Value (CLV)`**: To measure the long-term value of a customer.
* **`Average Order Value (AOV)`**: To measure the average basket size.
* **`Sales per Square Meter`**: To measure the efficiency of physical stores.

---

## 📈 4. Executive Summary

> *A holistic overview of Global Electronics’ performance between 2016–2021, revealing a steep post-2019 decline in revenue and profitability, with retention challenges across key customer segments.*

---

### 🧭 Executive Dashboard Overview

<div align="center">

<img src="Dashboard_Screenshots/01_Executive_Summary/Executive_Summary_Full.jpg" alt="Executive Summary Dashboard" width="850"/>

</div>

**Purpose:**  
This dashboard consolidates company-wide performance metrics into a single, interactive view — combining sales trends, profitability, customer segmentation, and product insights.

**Key Components**
- **5 KPI cards** tracking YTD revenue, profit, AOV, CLV, and growth.  
- **Global sales distribution** by continent.  
- **Revenue & profit trendline** across six years.  
- **Product and customer segment overviews.**  
- **Strategic recommendations** for decision-makers.

---

### 💼 KPI Snapshot — *2020 vs Prior Year*

<div align="center">

<img src="Dashboard_Screenshots/01_Executive_Summary/KPIs_2020.jpg" alt="2020 KPI Cards" width="800"/>

</div>

| KPI | 2020 | Δ vs 2019 |   Interpretation |
|------|------:|-----------:|:---------------|
| **Total Revenue (YTD)** | \$9.24M | 🔻 -49.2% | Demand contraction post-2019 peak |
| **Total Profit (YTD)** | \$5.42M | 🔻 -49.2% | Margin pressure across categories |
| **Average Order Value (AOV)** | \$2.00K | 🔻 -0.40% | Remained resilient despite sales decline |
| **Customer Lifetime Value (CLV)** | \$2.40K | 🔻 -49.2% | Customer loyalty erosion |
| **Revenue Growth (local)** | -49.23% |🔻 -0.00% | Minimal Currency impact |

📉 **Insight:**  
While overall revenue and profit nearly halved in 2020, average order value remained stable, suggesting that customer purchasing power or product pricing held steady.

💡 **Implication:**  
The decline was volume-driven, not price-driven — indicating lost customers rather than lower spend per transaction. Recovery efforts should therefore focus on retention and reactivation, not discounting.

---

### 📊 Growth Trend — *Revenue Peaked in 2019*

<div align="center">

<img src="Dashboard_Screenshots/01_Executive_Summary/Sales_Peak.jpg" alt="Sales peaked in 2019" width="750"/>

</div>

📈 **Insight:**  
Between 2016–2019, Global Electronics achieved consistent revenue growth, peaking at **\$5.7M** in Q4 2019.  
However, revenue fell sharply by **60% over the next two years**, with average quarterly revenue dropping from **\$2.6M → \$1.0M**.

💡 **Implication:**  
The business was overly reliant on volume-driven sales and lacked resilience in repeat purchases, exposing vulnerabilities when external shocks hit.

---

### 🧩 Product and Customer Revenue Drivers

<div align="center">

<img src="Dashboard_Screenshots/01_Executive_Summary/Top3.jpg" alt="Top Product Lines and Customer Segments" width="750"/>

</div>

📈 **Insight:**  
- **Computers** and **Home Appliances** generated **>60% of total profit**.  
- The **65+ age group** alone contributed **~50% of total revenue**, while younger cohorts (18-35) were underrepresented.

💡 **Implication:**  
Dependence on a narrow product mix and aging demographic poses long-term growth risks — diversification is essential.

---

### 👥 Customer Lifecycle Overview

<div align="center">

<img src="Dashboard_Screenshots/01_Executive_Summary/Customer_Base.png" alt="Customer Lifecycle & Retention" width="500"/>

</div>

📈 **Insight:**  
Of the **15K customers**,  
- **60.6%** are **Dormant** (no purchase in the last 12 months),
- **12.1%** are **At-Risk** (declining frequency, low engagement),
- **22.2%** are **Unacquired** (potential new market),  
- only **5%** remain **Active** (generating the majority of current revenue).

💡 **Implication:**  
Reactivating At-Risk and Dormant customers presents the fastest path to revenue recovery.
Short-term focus should include:
- **Personalized win-back email** campaigns targeting the At-Risk group
- **Loyalty incentives** (e.g., tiered rewards) for Active customers to prevent churn
- Using predictive churn models to identify early warning signals in repeat purchase behavior

---

### 🧭 Strategic Summary

| Focus Area | Key Takeaway | Business Action |
|-------------|--------------|-----------------|
| **Sales Trend** | Growth momentum collapsed post-2019 | Stabilize revenue base via customer retention |
| **Product Mix** | Profit concentrated in few categories | Diversify portfolio into mid-margin products |
| **Customer Base** | Aging, dormant customer segments | Launch reactivation & loyalty initiatives |
| **Geographic Focus** | North America = 60% of profit | Expand Europe; localize offers in APAC |

---

> 🧩 *Next Section → Data Cleaning Summary: how five raw data sources were transformed into a 99.6 % reliable analytics model powering this dashboard.*

---

