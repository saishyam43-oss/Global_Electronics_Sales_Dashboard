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

## 🧹 5. Data Cleaning Summary

> *Before analysis, over 5 years of raw data (2016–2021) from five independent CSV files were audited, cleaned, and standardized in SQL.  
This process transformed the dataset from inconsistent and unreliable into a **99.6% geo-validated, analytics-ready model**.*

---

### 🧭 Why SQL Instead of Excel?

The Sales table alone contained **60,000+ rows**, and joining multiple tables in Excel led to slow processing and inconsistent transformations.  
To ensure reproducibility and performance:

- A **SQLite database** was created  
- All raw CSVs were imported into SQL  
- Cleaning, validation, and reconstruction of each table was done using structured queries  
- The cleaned outputs were exported to Power BI for modeling

All SQL scripts are available in:  
📁 [`/Data_Cleaning_SQL`](Data_Cleaning_SQL/)

---

### 📄 Page 1 — Data Quality Overview

<div align="center">

<img src="Dashboard_Screenshots/02_Data_Cleaning_Summary/Data_Cleaning_Summary_1.jpg"  
     alt="Data Cleaning Summary Page 1" width="850"/>

</div>

#### 🔍 Key Insights

- **461 invalid sales rows removed**, including duplicates, missing keys, impossible dates, and outliers.  
- **100% clean City → State → Country mappings** achieved using SQL lookup tables.  
- **19.54% duplicate keys** initially existed in the Sales table; all duplicates were flagged and resolved.  
- **32k+ inconsistent date values** standardized from mixed formats (`DD-MM-YYYY`, `MM/DD/YYYY`, text dates).  
- The **Sales and Customers tables accounted for over 70%** of all detected data issues.  
- Primary error categories: invalid geography, impossible dates, duplicate rows, and product-key mismatches.

---

### 🌍 Page 2 — Geographic Data Quality & Validation

<div align="center">

<img src="Dashboard_Screenshots/02_Data_Cleaning_Summary/Data_Cleaning_Summary_2.jpg"  
     alt="Data Cleaning Summary Page 2" width="850"/>

</div>

#### 🔍 Key Insights

- Early validation identified **255+ geographic mismatches** across 5 countries.  
- After standardization, the dataset reached **100% state–country consistency**.  
- **76.32%** of all detected issues were **correctable**, minimizing data loss.  
- **Ambiguous or corrupted date formats** were documented and isolated as a final limitation.  
- Cleaned and validated tables were exported into Power BI for modeling.

---

### 📊 Cleaning Impact Summary

| Cleaning Metric | Result |
|-----------------|--------|
| Invalid Sales Removed | **461 records** |
| Geographic Mappings Corrected | **100% clean** (state → country) |
| Duplicate Keys Flagged | **19.54% of Sales**, **3.25% of Products** |
| Dates Standardized | **32,054 → 91,993** usable date values |
| Data Reliability Score | **99.6%** |

---

### 🧱 Final Output — Clean Data Model (Star Schema)

<div align="center">

![Data Model](https://github.com/saishyam43-oss/Global_Electronics_Sales_Dashboard/blob/main/Data_Model/Sales_Operations/Data_Model.jpg?raw=True)

</div>

The cleaned SQL tables were transformed into a **Power BI star schema**:

- **FactSales** (central fact table)  
- **DimProducts**, **DimCustomers**, **DimStores**, **DimExchangeRates**  
- Optimized for DAX performance, filtering, and drilldowns

Model notes:  
📁 [`/Data_Model/Sales_Operations/readme.md`](/Data_Model/Sales_Operations/readme.md)

---

### 📘 Technical Appendix

<details>
<summary><strong>SQL Scripts, DAX Measures, and Cleaning Tables</strong></summary>

- SQL Cleaning Scripts → [`/Data_Cleaning_SQL`](Data_Cleaning_SQL/)  
- DAX Measures & Calculated Columns → [`/DAX`](DAX/)  
- Data Audit Tables (Excel) → [`/Data_Cleaning_Tables`](Data_Cleaning_Tables/)  

</details>

---

# 📘 6. Analytical Insights & Business Narrative

With the data now cleaned, validated, and modeled into a reliable star schema, the next section focuses on extracting **business-ready insights**.  
Each dashboard has been designed to answer a specific strategic question faced by Global Electronics, moving from product health to customer behavior and regional performance.

The analysis is structured into four “Acts,” each representing a pillar of the business:

---

## 📑 Analysis Table of Contents

- **Act 1: Product Performance Overview**  
  How categories, brands, and SKUs contribute to revenue, profit, and margin.  
- **Act 2: Sales Trends & Time Performance**  
  How revenue, profit, orders, and seasonality evolved across 2016–2021.  
- **Act 3: Customer Insights & Retention**  
  How different customer segments behave across value, recency, and cohorts.  
- **Act 4: Regional & Store Performance**  
  Which regions and stores drive growth, efficiency, and margin.

---

---

## 🟦 Act 1: Product Performance Overview

Global Electronics needed clarity on which product lines drive the business, where margin leakage occurs, and how SKU-level movement shapes category performance. This section analyzes revenue concentration, brand profitability, category economics, and regional product performance.

---

# Main Product Dashboard

<p align="center">
  <img src="Dashboard_Screenshots/03_Product_Dashboard/Product_Performance_1.png" width="900">
</p>

---

### 📊 KPI Summary

| **KPI** | **Value / Insight** | **Recommended Action** |
|--------|----------------------|-------------------------|
| **Total Revenue (YTD)** | **$1.04M**, with **1.9% YoY growth** | ​Leverage early-year growth to drive a broader revenue rebound |
| **Total Profit (YTD)** | **$606.57K**, **58.59% margin** | Maintain margin discipline and cost controls |
| **Units Sold (YTD)** | **3,770 units** | Use top-selling SKUs as benchmarks for future strategies |
| **Most Profitable Category** | **Computers ($11.23M)** | Invest in leaders and nurture other categories for balance. |

---

# Detailed Insights (Graph-by-Graph)

---

### **1. Revenue Share of Top 5 Categories** *(Pie Chart)*  
**Business Question:**  
*Which product categories contribute most to the company’s revenue?*

**Answer:**  
- Top 5 categories generate **$48.57M of $55.55M (~87%)**  
- **Computers + Home Appliances exceed 60%** of top-5 revenue  
- Indicates **major revenue concentration risk**

---

### **2. Profit Margin % by Brand (Top 5)** *(Bar Chart)*  
**Business Question:**  
*Which brands deliver the strongest margins?*

**Answer:**  
- Top brands deliver **~60% margin consistently**  
- Shows strong pricing power and operational efficiency  
- Highlights best-in-class category–brand combinations

---

### **3. Revenue vs Profit Margin (Subcategory Scatter Plot)** *(Scatter Chart)*  
**Business Question:**  
*How do subcategories perform in terms of revenue and profitability?*

**Answer:**  
Subcategories fall into clear BCG quadrants:

#### ⭐ Stars — *High Revenue, High Margin*  
- **Computers**, **Home Appliances**  
- Strong value drivers and core business pillars  

#### 💰 Cash Cows — *High Revenue, Moderate Margin*  
- **TV & Video**  
- Reliable performers but sensitive to margin pressure  

#### ❓ Question Marks — *High Margin, Low Revenue*  
- **Cameras & Camcorders**, **Cell Phones**  
- Good profitability but limited market scale  

#### 🐶 Dogs — *Low Revenue, Low Margin*  
- **Audio**, **Games & Toys**, **Music/Movies/Audiobooks**  
- Inventory drag and poor ROI  

---

### **4. Top 8 Products by Units Sold** *(Bar Chart)*  
**Business Question:**  
*Which SKUs drive volume?*

**Answer:**  
- All top SKUs are **Computers**, confirming extremely concentrated volume  
- Customer demand is heavily skewed toward limited product families  
- Implies high inventory dependency risk

---

### 🎯 Action Items

- Develop mid-tier categories to reduce reliance on Computers + Home Appliances  
- Apply high-margin brand strategies to mid-tier brands  
- Fix low-margin, high-revenue subcategories (Cash Cows) through pricing or cost work  
- Expand top-performing Computer SKUs and secure inventory depth  
- Build new category growth engines to diversify revenue

---

# 📸 Alternate Product Dashboard

<p align="center">
  <img src="Dashboard_Screenshots/03_Product_Dashboard/Product_Performance_2.jpg" width="900">
</p>

---

# 🔍 Detailed Insights (Graph-by-Graph)

---

### **1. Revenue Share Across All Categories** *(Pie Chart – Full View)*  
**Business Question:**  
*What does revenue concentration look like across the full category range?*

**Answer:**  
- **Computers + Home Appliances = ~54%** of total revenue  
- Smaller categories contribute only marginally  
- Portfolio breadth is limited, reflecting heavy top-end dependence

---

### **2. Profit Margin % by Brand (Bottom 5)** *(Bar Chart)*  
**Business Question:**  
*Which brands underperform on margin?*

**Answer:**  
- Bottom 5 brands average **~54.65% margin**  
- Reasonable but materially below top-tier brands (60%+)  
- Signals inefficiencies in:  
  - Cost structure  
  - Supplier terms  
  - Discount dependency  
  - Market alignment  

---

### **3. Least Sold Products** *(Bar Chart)*  
**Business Question:**  
*Which SKUs reduce inventory efficiency?*

**Answer:**  
- Home Appliances dominate the slow-moving SKU list  
- SKU saturation and misaligned assortment  
- Long-tail products increase storage and handling costs

---

### 🎯 Action Items

- Promote under-indexed categories to rebalance revenue  
- Audit low-margin brands for supply chain, pricing, or assortment issues  
- Rationalize or delist weak Home Appliance SKUs  
- Push high-performing brands through placement and bundling initiatives  

---

# 📸 Detailed Product Metrics & Regional Breakdown

<p align="center">
  <img src="Dashboard_Screenshots/03_Product_Dashboard/Product_Performance_3.jpg" width="900">
</p>

---

# 🔍 Detailed Insights (Matrix-by-Matrix)

---

### **1. Detailed Product Metrics Matrix** *(Matrix Table)*  
**Business Question:**  
*How do revenue, cost, margin, and units vary across products?*

**Answer:**  
- Computers lead on revenue, profit, and margin  
- Home Appliances perform well but inconsistently at SKU level  
- Categories like Games, Audio, Toys lag severely  
- High margin variation within categories suggests inconsistent procurement or discounting practices

---

### **2. Regional Product Revenue Breakdown** *(Drillable Matrix)*  
**Business Question:**  
*Which categories perform best in different regions?*

**Answer:**  
- Developed markets: Computers & Home Appliances dominate  
- Emerging markets: Audio, Games, and niche categories show stronger relative traction  
- Uniform assortment strategy will underperform globally

---

### 🎯 Action Items

- **Stars:** Expand variants, protect availability, increase marketing  
- **Cash Cows:** Maintain pricing discipline and optimize costs  
- **Question Marks:** Test for scalability before deeper investment  
- **Dogs:** Reduce exposure via SKU rationalization, bundling, or clearance  
- Tailor assortments and pricing to each region’s strengths  
- Fix internal margin variability by improving procurement and discount policies  

---

# 📝 Act 1 Summary

Act 1 reveals a product portfolio heavily concentrated in two categories and driven by a limited set of SKUs. While profitability is strong, margin leakage and inventory inefficiencies persist across several subcategories and brands. Balanced growth requires diversification, regional tailoring, SKU rationalization, and scaling high-performing product families.

---
