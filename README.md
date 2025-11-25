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

# 🟦 **ACT 1 — Product Performance & Portfolio Diagnosis**

This section analyzes **what Global Electronics sells**, **which categories drive growth**, and **which product segments drain performance**. The goal is to understand portfolio strengths and weaknesses through a combination of **revenue concentration**, **margin distribution**, **SKU performance**, and **subcategory positioning**.

---

## 📸 **Product Dashboard — Full View**

> **🔎 Click a link below to view each full dashboard page:**

- **📄 Page 1:** [Open Image](Dashboard_Screenshots/03_Product_Dashboard/Product_Performance_1.png)
- **📄 Page 2:** [Open Image](Dashboard_Screenshots/03_Product_Dashboard/Product_Performance_2.jpg)
- **📄 Page 3:** [Open Image](Dashboard_Screenshots/03_Product_Dashboard/Product_Performance_3.jpg)

---

## 📌 **KPI Summary**

Below is a snapshot of the key product-level performance indicators that anchor the Product dashboard. These KPIs set the context before diving into category- and brand-level visuals.

<p align="center">
  <img src="Dashboard_Screenshots/03_Product_Dashboard/KPI_Cards_2021_Products.png">
</p>

| **KPI** | **Value / Insight** | **Recommended Action** |
|--------|----------------------|--------------------------|
| **Total Revenue (YTD)** | **$1.04M**, **–88.8% vs PY**, reflecting severe contraction in 2021. | Address root causes of revenue collapse and rebuild category momentum. |
| **Total Profit (YTD)** | **$606.57K**, **58.56% margin**, margins remain stable despite revenue decline. | Maintain disciplined pricing, protect high-margin SKUs. |
| **Units Sold (YTD)** | **3,770 units**, sharp drop in volume. | Review category-level demand loss and reactivate best-selling SKUs. |
| **Top SKU Units (2021)** | **36 units**, dramatically lower than historical levels. | Investigate SKU visibility, pricing, and demand generation gaps. |
| **Most Profitable Category (2021)** | **Computers — $261.08K profit**. | Strengthen core category assortment and protect margin leaders. |

---

## **A. Category Revenue Contribution (Pie Charts)**


### ❓ **Business Question**  
**Which categories contribute the most to revenue, and how concentrated is the portfolio?**

---

### 📊 **Top 5 Categories vs All Categories**

<p align="center">
  <img src="Dashboard_Screenshots/03_Product_Dashboard/Pie_Chart_1.png" width="45%">
  <img src="Dashboard_Screenshots/03_Product_Dashboard/Pie_Chart_2.png" width="45%">
</p>

---

### ⭐ **Insights**

#### **1. Extreme Revenue Concentration**
- The **Top 5 categories generate \$48.57M**, accounting for **~87.5% of total revenue (\$55.55M)**.
- This reflects a **tightly concentrated portfolio** and strong reliance on a few key categories.

#### **2. “Computers” Is the Dominant Driver**
- Top 5 view: **Computers = 39.56%**  
- All Categories: **Computers = 34.59%**
- Slight decline in share after adding long-tail categories, but the category remains the unchallenged leader.

#### **3. Long-Tail Categories Matter Collectively**
- Audio, Games, Toys, Music, Movies, etc. contribute **\$6.98M (~12.5%)**.
- Individually small but collectively worth nurturing.

---

### 💡 **Action Items**

#### **1. Strengthen High-Performing Segments**
Focus forecasting, funding, and stock allocation on:
- **Computers**
- **Home Appliances**
- **Cameras & Camcorders**
- **Cell Phones**
- **TV & Video**

#### **2. Grow the Long Tail**
- Targeted digital ads for niche categories  
- Bundle low-volume items with Computers or Home Appliances  
- Adjust pricing/positioning for slow movers  

#### **3. Optimize Pricing & Assortment**
- Promote high-margin underdogs  
- Repackage poor performers  
- Retire unviable SKUs  

---

---

## **B. Profit Margin Distribution by Brand (Top 5 & Bottom 5)**


### ❓ **Business Question**  
**How consistent are margins across brands, and where do margin risks exist?**

---

#### 📊 **Brand Margin Charts**

<p align="center">
  <img src="Dashboard_Screenshots/03_Product_Dashboard/Column_Chart_1.png" width="45%">
  <img src="Dashboard_Screenshots/03_Product_Dashboard/Column_Chart_2.png" width="45%">
</p>

---

### ⭐ **Insights**

#### **1. Strong Margin Portfolio**
- Average margin: **58.59%**
- Even the weakest brand, **Tailspin Toys**, posts **54.6%**, which is very profitable for retail.

#### **2. Very Narrow Margin Spread**
- Range: **54.6% → 60.2%**  
- Indicates:
  - Stable pricing power  
  - Standardized cost efficiency  
  - Low performance risk  

#### **3. Top Performers Lead with Discipline**
- Proseware: **60.2%**  
- Fabrikam, A. Datum, Southridge Video also exceed average

#### **4. Bottom Performers Are Only Slightly Below Average**
- Brands like **Wide World Importers, Litware, Northwind Traders** remain close to average margins.

---

### 💡 **Action Items**

#### **1. Extract Best Practices from Leaders**
Study:
- Pricing strategies  
- Cost structures  
- Vendor terms  
- SKU mixes  

#### **2. Margin Lift for Laggards**
- Evaluate underperforming SKUs  
- Improve merchandising  
- Adjust pricing or packaging  

#### **3. Continuous Monitoring**
Track margins quarterly for trend shifts and early warnings.

---

---

## **C. Subcategory Positioning — Revenue vs Profit Margin (BCG Quadrant)**


### ❓ **Business Question**  
**Which subcategories are Stars, Cash Cows, Question Marks, and Dogs?**

---

<p align="center">
  <img src="Dashboard_Screenshots/03_Product_Dashboard/Scatter_Plot.png">
</p>

---

### ⭐ **Insights**

#### **⭐ Stars — High Revenue, High Margin**
- **Camcoders, Televisions, Projectors & Screens, Movie DVD**  
Backbone of the business.

#### **💰 Cash Cows — High Revenue, Moderate Margin**
- **Desktops, Water Heaters, Laptops, Touch Screen Phones**  
Volume-heavy but moderate margins.

#### **❓ Question Marks — High Margin, Low Revenue**
- **Coffee Machines, Microwaves, Cellphone Accessories**  
Great margins, limited scale.

#### **🐶 Dogs — Low Revenue, Low Margin**
- **Boxed Games, Fans, Home & Office Phones**  
Portfolio drag; low ROI.

---

## 💡 **Action Items**

#### **Invest Heavily in Stars**
- Expand lines  
- Stabilize supply chain  
- Drive marketing  

#### **Optimize Cash Cows**
- Improve efficiencies  
- Upsell warranties/accessories  

#### **Test & Scale Question Marks**
- Try campaigns  
- Bundle offerings  
- Pilot micro-expansion  

#### **Rationalize Dogs**
- Phase out weak SKUs  
- Sell via bundles  
- Switch to online-only distribution  

---

---

## **D. SKU-Level Performance — Top vs Least Selling Products**


### ❓ **Business Question**  
**Which SKUs are overperforming and which need urgent action?**

---

<p align="center">
  <img src="Dashboard_Screenshots/03_Product_Dashboard/Bar_Chart_1.png" width="45%">
  <img src="Dashboard_Screenshots/03_Product_Dashboard/Bar_Chart_2.png" width="45%">
</p>

---

### ⭐ **Insights — Least Sold Products**

#### **1. Entire Bottom List is Home Appliances**
Lamps and chandeliers dominate the “least sold” list, indicating a systemic category issue.

#### **2. Extremely Low Traction**
Several SKUs sold **only one unit**, suggesting:
- Zero demand  
- Wrong pricing  
- Mismatched consumer taste  

#### **3. Likely Causes**
- Weak visibility online/in-store  
- Outdated designs  
- Uncompetitive pricing  
- Seasonal mismatch  

---

### ⭐ **Insights — Top Sold Products**

#### **1. Computers Completely Dominate**
All top 8 SKUs belong to desktop PCs.

#### **2. Strong Volume Consistency**
Sales range: **507 → 550 units** across brands/models.

#### **3. Clear Product-Market Fit**
The PC segment shows repeatable demand across variants.

---

### 💡 **Action Items**

#### **For Least Sellers**
- Re-evaluate product-market fit  
- Discount or bundle  
- Consider discontinuation  

#### **For Top Sellers**
- Prioritize inventory  
- Develop bundles (keyboards, monitors, protection plans)  
- Increase marketing exposure  

---

---

## **E. Detailed Metrics & Regional Product Performance**

### ❓ **Business Question**  
**Which categories and regions drive volume, revenue, and profit?**

---

<p align="center">
  <img src="Dashboard_Screenshots/03_Product_Dashboard/Matrix_1.png">
</p>

---

## ⭐ **Insights — Product Metrics Matrix**

#### **1. Revenue & Volume Powerhouses**
- **Computers**: 43,954 units, \$19.2M, 58.44% margin  
- **Home Appliances**: 18,361 units, \$10.8M

#### **2. High-Margin Hidden Gems**
- Cameras & Camcorders: **60.12%**  
- Music/Movies/Audiobooks: **60.98%**  
High margins but small-scale → expansion potential.

#### **3. Laggards Needing Review**
- Cell Phones: **56.58%**  
- Games & Toys: **54.73%**  
Increase focus on cost reduction and product mix optimization to improve margins.

---

<p align="center">
  <img src="Dashboard_Screenshots/03_Product_Dashboard/Matrix_2.png">
</p>

### ⭐ **Insights — Regional Product Matrix**

#### **1. U.S. Drives the Business**
Dominates in all the categories.

#### **2. UK, Germany & Canada Are Strong Secondary Markets**
Good performance across major categories.

#### **3. France, Italy, Netherlands Underperform**
Low revenue and weak category penetration.

---

### 💡 **Action Items**

#### **1. Scale Strength Markets**
- U.S., UK, Germany, Canada  
- Allocate inventory & promotions accordingly  

#### **2. Grow High-Margin Categories**
Push Cameras/Camcorders and Music/Audiobooks where local demand exists.

#### **3. Improve Weak Regions**
Conduct market research, adjust channels, run pilot campaigns.

---

## 🏁 **Act 1 Summary**

Global Electronics’ product portfolio shows strong revenue and margin concentration in Computers and Home Appliances, with these categories serving as core business drivers. While overall margin stability is maintained, performance across categories is mixed: some segments (like Cameras, Audio, Games, and Media) deliver lower volume or profit margins and require targeted intervention. In addition, underpenetrated regions and long-tail SKUs present clear opportunities for strategic portfolio optimization and international growth.

---

# 🟦 **ACT 2 — Sales Performance Over Time**

This section analyzes the **trajectory of Global Electronics’ business from 2016–2021**.  
We break down how revenue, profit, margin, order volume, delivery speed, category mix, and regional profit contributions evolved over time.  
This narrative exposes the true drivers behind GE’s rise to a 2019 peak and its sharp contraction afterward.

---

## 📸 **Sales Performance Dashboard — Full View**

> **🔎 Click a link below to view each full dashboard page:**

- **📄 Page 1:** [Open Image](Dashboard_Screenshots/04_Time_Dashboard/Time_Trends_1.jpg)
- **📄 Page 2:** [Open Image](Dashboard_Screenshots/04_Time_Dashboard/Time_Trends_2.jpg)
- **📄 Page 3:** [Open Image](Dashboard_Screenshots/04_Time_Dashboard/Time_Trends_3.jpg)
- **📄 Page 4:** [Open Image](Dashboard_Screenshots/04_Time_Dashboard/Time_Trends_4.jpg)

---

## 📌 **KPI Summary**

These operational KPIs provide a top-level view of business health across revenue, profitability, customer experience, and order volume before drilling into multi-year trends.

<p align="center">
  <img src="Dashboard_Screenshots/04_Time_Dashboard/KPI_Cards_2021_Time.png">
</p>

| **KPI** | **Value / Insight** | **Recommendation** |
|--------|----------------------|---------------------|
| **Total Revenue (YTD)** | **$1.04M**, **–88.8% vs PY**. | Investigate category and region-level collapse. |
| **Total Profit (YTD)** | **$606.57K**, **58.56% margin**, stable YoY. | Leverage stable margin to rebuild volume. |
| **Avg Delivery Days** | **3.88 days**, **–6.0% YoY**. | Maintain speed, highlight in marketing comms. |
| **Total Orders (YTD)** | **494 orders**, **–89.3% vs PY**. | Rebuild order momentum via campaigns and reactivation. |

---

## **A. Revenue, Profit & Margin Over Time**

### ❓ **Business Question**  
**How have revenue, profit, and margin trended historically?**

---

<p align="center">
  <img src="Dashboard_Screenshots/04_Time_Dashboard/RPM_Over_Time.png">
</p>

---

### ⭐ **Insights**

#### **1. Revenue Growth and Collapse**
- Revenue grew from **$6.9M (2016)** to a peak of **$18.2M (2019)**.
- It then dropped sharply to **$9M in 2020**, and shows **$1.0M in 2021**, but **2021 contains only Jan–Feb data**, so annual comparisons should consider this limitation.

#### **2. Profit Decline Was Slower Than Revenue Decline**
- Profit rose from **$4.1M → $10.7M (2019)**.
- It declined to **$5.3M in 2020**, which is *less severe* than the revenue drop.
- The 2021 profit line also looks extremely low due to only two months of data.

#### **3. Profit Margin Remains Highly Stable**
- Despite volume shocks, margin stays between **58.38%–58.56%** after 2017.
- This consistency indicates **strong cost control and pricing discipline**, even during revenue collapse.

#### **4. 2019 Remains the Operational Benchmark**
- Highest revenue  
- Highest profit  
- Strong margin  
- Strong order volume  
- Best alignment of demand + operational performance

---

### 💡 **Action Items**

#### **1. Diagnose the 2020–21 Downturn**
- Identify root causes: supply chain, macro-economic shocks, lost customer cohorts, category failures, or channel issues.

#### **2. Use Margin Stability to Fuel Recovery**
- Since margin integrity is intact, the focus should be on **volume recovery, not margin repair**.

#### **3. Recreate 2016–2019 Playbook**
- Review campaigns, product launches, regional pushes, or assortment strategies that drove the rise to 2019.

#### **4. Strengthen Early Warning Systems**
- Build automated checks for sudden volume dips or channel disruptions.

---

---

## **B. Year-over-Year Revenue Growth (%)**

### ❓ Business Question  
**How volatile has revenue growth been?**

---

<p align="center">
  <img src="Dashboard_Screenshots/04_Time_Dashboard/YoY_Revenue_Growth.png">
</p>

---

### ⭐ **Insights**

#### **1. Explosive Expansion (2018–2019)**
- **2018: +71.97% growth — breakout year**  
- **2019: +42.65% growth**  
- Back-to-back exceptional years showing strong scalability.

#### **2. Severe Contraction in 2020**
- Revenue **plunged –49.23%**, the largest drop in the dataset.  
- Confirms a major disruption rather than natural market ebbing.

#### **3. High Volatility**
- YoY growth swings from +72% → +43% → –49%.  
- Indicates dependence on key categories/regions and vulnerability to shocks.

---

### 💡 **Action Items**

#### **1. Conduct a Deep Dive on 2020**
- Which categories collapsed?  
- Which regions declined first?  
- Any customer churn patterns?

#### **2. Diversify & Reduce Dependence**
- Expand product and region footprint.  
- Build resilience against category-specific or region-specific shocks.

#### **3. Build Leading Indicator Dashboards**
- Monitor forecast pipeline, order backlog, search demand, promo uplift, supply health.

---

---

## **C. Order Volume & Delivery Speed Over Time**

### ❓ Business Question  
**How have demand and operational efficiency evolved?**

---

<p align="center">
  <img src="Dashboard_Screenshots/04_Time_Dashboard/Order_Volume_Delivery_Speed.png">
</p>

---

### ⭐ **Insights**

#### **1. Orders Increased Until 2019, Then Collapsed**
- Orders grew from **2.8K → 9.0K (2016–2019)**.
- They then fell dramatically to **5.9K (2020)** and **0.5K (2021)**.

#### **2. Delivery Speed Improved Even as Orders Increased**
- Average delivery time improved from **7.3 days → 4.1 days**, even during years of rising demand.
- This indicates strong process efficiency and scalable fulfillment capability.

#### **3. Post-2019, Delivery Speed Stayed Good but Didn’t Accelerate Further**
- Even as volume plunged in 2020–21, delivery days stayed around **4 days**, not dropping significantly below the historical range.
- This means:
  - Operations remained stable.
  - But the system didn’t capitalize on the lower workload to become even faster.

#### **4. Efficiency Was Maintained Through Volatility**
- No operational degradation during the downturn.
- But no meaningful additional acceleration either.

---

### 💡 **Action Items**

#### **1. Diagnose Order Volume Loss**
- Identify category-level order drivers.  
- Evaluate lost customer segments.

#### **2. Protect Fast Delivery SLAs**
- Fast delivery is a competitive advantage for recapturing demand.

#### **3. Reactivate Channels**
- Use fulfillment strength as a marketing message ("fast delivery guaranteed").

---

---

## **D. Operational Health Trends (Orders, AOV, Margin)**

### ❓ Business Question  
**What do orders, AOV, and margins reveal about health?**

---

<p align="center">
  <img src="Dashboard_Screenshots/04_Time_Dashboard/Operational_Health_Trends.png">
</p>

---

### ⭐ **Insights**

#### **1. Orders Show High Volatility**
- Strong multi-year rise → catastrophic drop after 2019.

#### **2. AOV Remains Surprisingly Stable**
- AOV stays flat across all years, even during the crisis.  
- Customers who remained continued to spend **similar amounts per transaction**.

#### **3. Margin Discipline Is Outstanding**
- Margins stay within a narrow band (~58.4%–59.1%).  
- Confirms superior operational control.

#### **4. Profitability Held Despite Volume Loss**
- Margin stability + stable AOV = strong core operating model.  
- Volume loss is the primary issue.

---

### 💡 **Action Items**

#### **1. Focus on Volume Recovery**
- Not margin repair. The fundamentals are sound.

#### **2. Use Bundling to Lift AOV**
- Accessories, warranties, cross-category pairings.

#### **3. Monitor Order Value Mix**
- Ensure high-margin SKUs still lead in recovery.

---

---

## **E. Cumulative Sales Progress by Year**

### ❓ **Business Question**  
**How do yearly sales trajectories compare, and which years demonstrate the strongest and weakest cumulative revenue momentum?**

---

<p align="center">
  <img src="Dashboard_Screenshots/04_Time_Dashboard/Cumulative_Sales_Progress.png">
</p>

---

### ⭐ **Insights**

#### **1. 2019 Is the Benchmark Peak**
- Fastest revenue accumulation curve.  
- Outperforms all other years by a large margin.

#### **2. Healthy Momentum in 2017–2018**
- Consistent upward trajectories.  
- Shows predictable seasonal and campaign uplift.

#### **3. 2020 Started Strong, Then Collapsed**
- Early months track above 2019  
- Mid-year plateau indicates sudden disruption.

#### **4. 2021 Is the Lowest Curve on Record**
- Almost flat, reflecting near-zero business activity.

---

### 💡 **Action Items**

#### **1. Study 2019 Drivers**
- Campaigns, category mix, region strategy, promotions.

#### **2. Develop Recovery Playbooks**
- Based on past acceleration points (e.g., March uplift, Q4 surge).

#### **3. Forecasting Enhancements**
- Integrate pattern recognition from past high-performing years.

---

---

## **F. Product Category Profit Contribution Over Time**

### ❓ **Business Question**  
**Which product categories consistently drive profit over time, and how has the category mix shifted during periods of growth and decline?**

---

<p align="center">
  <img src="Dashboard_Screenshots/04_Time_Dashboard/Stacked_Area_Category.png">
</p>

---

### ⭐ **Insights**

#### **1. Computers & Home Appliances Dominate**
- Consistently the two widest bands → the business foundation.

#### **2. Secondary Categories Provide Meaningful Support**
- Cell Phones, Cameras & Camcorders provide stable secondary contributions.

#### **3. Small Categories Are Predictable and Low Impact**
- Audio, Games, Music/Movies/Audiobooks contribute minimally but consistently.

#### **4. Mix Remains Stable Even During 2020 Shock**
- No major shifts in category share → disruption affected all categories equally.

---

### 💡 **Action Items**

#### **1. Protect Core Categories**
- Maintain investment, marketing, availability.

#### **2. Grow Secondary Profit Drivers**
- Push cell phones, cameras, TV & video through targeted campaigns.

#### **3. Rationalize Long-Tail Categories**
- Evaluate low-performing subcategories for phase-out or repositioning.

---

---

## **G. Regional Profit Contribution Over Time**

### ❓ **Business Question**  
**Which geographic regions contribute most to profitability, and how stable or volatile are these contributions over time?**

---

<p align="center">
  <img src="Dashboard_Screenshots/04_Time_Dashboard/Stacked_Area_Region.png">
</p>

---

### ⭐ **Insights**

#### **1. The U.S. Is the Profit Engine**
- Largest profit contributor across all years by a large margin.

#### **2. UK & Germany Form a Solid Second Tier**
- Consistent mid-level contributions.

#### **3. Smaller Regions Are Volatile and Low Impact**
- Netherlands, Italy, Australia show fluctuating thin bands.

#### **4. No Significant New Emerging Markets**
- Mix remains structurally similar throughout the years.

---

### 💡 **Action Items**

#### **1. Defend the U.S. Market**
- It's the anchor for total profitability.  
- Prioritize retention, inventory, promotions.

#### **2. Expand UK/Germany**
- Leverage stable performance to unlock incremental gains.

#### **3. Pilot in Smaller Regions Before Investing**
- Validate product-market fit with small bets.

---

## **H. Monthly Sales Heatmap**

### ❓ **Business Question**  
**Which months drive peak performance, where do seasonal slowdowns occur, and how did external disruptions affect monthly sales patterns?**

---

<p align="center">
  <img src="Dashboard_Screenshots/04_Time_Dashboard/Monthly_Sales_Heatmap.png">
</p>

---

### ⭐ **Insights**

#### **1. Strong Seasonality**
- **Jan–Feb** and **Nov–Dec** are consistently high-performing months.

#### **2. Mid-Year Variability**
- 2018–19 show mid-year surges (May–Sep).

#### **3. 2020 Collapses After March**
- Early success abruptly reverses due to external disruptions.

#### **4. 2021 Shows Systemic Weakness**
- Almost all months below $650K.

---

### 💡 **Action Items**

#### **1. Double Down on Peak Seasons**
- Match inventory, promos, staffing to Jan–Feb and holiday periods.

#### **2. Mitigate Spring Slowdowns**
- Launch mid-year promos or category spikes.

#### **3. Rebuild Post-2020 Momentum**
- Understand what worked in early 2020 and duplicate in recovery.

---

## 🏁 **Act 2 Summary**

GE experienced a **strong rise to a 2019 peak** driven by solid category mix and operational efficiency.  
A severe downturn in 2020–21 hit volume and revenue hard, but **margins, AOV, and cost control held steady**, proving strong internal resilience.  
Future strategy must prioritize **volume recovery**, **regional expansion**, and **seasonal optimization** while safeguarding the profitable core categories.

---

# 🟦 ACT 3 — Customer Insights & Retention Analysis

---

## 📸 **Customer Insights Dashboard — Full View**

> **🔎 Click a link below to view each full dashboard page:**

- **📄 Page 1:** [Open Image](Dashboard_Screenshots/05_Customer_Dashboard/Customer_Insights_1.jpg)
- **📄 Page 2:** [Open Image](Dashboard_Screenshots/05_Customer_Dashboard/Customer_Insights_2.jpg)
- **📄 Page 3:** [Open Image](Dashboard_Screenshots/05_Customer_Dashboard/Customer_Insights_3.jpg)
- **📄 Page 4:** [Open Image](Dashboard_Screenshots/05_Customer_Dashboard/Customer_Insights_4.jpg)

---

## 📌 **KPI Summary**

A quick overview of customer base health, value metrics, and acquisition performance.

<p align="center">
  <img src="Dashboard_Screenshots/05_Customer_Dashboard/KPI_Cards_2021_Customer.png">
</p>

| **KPI** | **Value & Insight** | **Action Recommendation** |
|--------|----------------------|---------------------------|
| **Active Customers (YTD)** | **485 active vs 15K total**, major retention decline. | Launch reactivation campaigns. |
| **AOV** | **$2.10K**, **+4.6% YoY**. | Introduce smaller bundles to boost frequency. |
| **CLTV** | **$2.14K**, **–11.1% YoY**. | Improve cross-sell & lifecycle engagement. |
| **New Customers (YTD)** | **66**, **–93% YoY**. | Rebuild acquisition pipeline. |

---

---

## 👥 A. Customer Demographics by Age & Gender

### ❓ Business Question  
**Which age and gender segments form the core customer base, and where should targeting and engagement efforts focus?**

---

<p align="center">
  <img src="Dashboard_Screenshots/05_Customer_Dashboard/Customer_Demographics.png">
</p>


### ⭐ Key Insights
- **65+ age group is the largest segment**, exceeding **4.5K customers**, making seniors the primary revenue base.
- **Gender split is nearly balanced** across all age ranges, showing no major gender skew.
- **36–65 age groups** form a strong middle-aged customer backbone with high stability.
- **18–25 segment is the smallest**, indicating weak youth acquisition or limited product fit.

### 💡 Action Recommendations
- Build **senior-focused engagement programs**, emphasizing ease of use, support, and relevant offers.
- Strengthen **mid-life customer retention** with loyalty rewards and recurring purchase incentives.
- Launch **youth awareness campaigns** targeting the 18–35 range to diversify the customer mix (student discounts, digital-first messaging, influencer tie-ins).
- Conduct **product-fit analysis** for younger demographics to identify missing offerings or UX gaps.

---

---

## 💰 B. Revenue & Profit by Age & Gender

### ❓ Business Question  
**Which demographic segments generate the highest financial contribution?**

---

<p align="center">
  <img src="Dashboard_Screenshots/05_Customer_Dashboard/Revenue_Profit.png">
</p>

### ⭐ Key Insights
- **65+ customers deliver the highest revenue and profit**:  
  - Female: **$7.9M**  
  - Male: **$8.6M**  
  - Total Profit: **$9.6M**
- **36–65 age brackets** produce stable, mid-to-high revenue levels.
- **18–25 cohort** generates the lowest revenue and profit.
- Profit curves closely match revenue curves, indicating consistent margin structure across demographics.

### 💡 Action Recommendations
- Double down on **senior-targeted product bundles** and services to sustain high-margin contribution.
- Reinforce **mid-life retention programs** with lifecycle messaging and targeted cross-sell.
- Develop **youth-oriented SKUs**, entry-price products, or digital services to increase penetration among younger users.
- Use **profit curve consistency** to confidently scale demographic-targeted pricing strategies.

---

---

## 💳 C. CLTV & AOV by Age Group & Gender

### ❓ Business Question  
**Which demographic groups have the highest lifetime value and spending potential?**

---

<p align="center">
  <img src="Dashboard_Screenshots/05_Customer_Dashboard/CLTV_AOV.png">
</p>

### ⭐ Key Insights
- **Females aged 26–35** exhibit the **highest CLTV (> $5,500)** and highest AOV.
- **Male CLTV increases sharply in older groups**, peaking at **56–65** and **65+**.
- CLTV for females shows a clear **midlife dip**. CLTV for males is more stable and increases, peaking at 56–65.
- AOV remains **consistent** across demographics (~$2,100–$2,250), supporting stable forecasting.

### 💡 Action Recommendations
- Target older male customers with **renewal programs, extended warranties, premium bundles, loyalty and exclusive value programs**.
- Create **exclusive subscription plans or VIP programs** for 26–35 female customers to maximize their high CLTV.
- Investigate causes behind midlife CLTV dip for females → refine product recommendations, adjust pricing, or personalize lifecycle messaging.
- Use stable AOV to develop **predictive revenue models, personalized offers, and bundle recommendations**.

---

---

## ⏳ D. Customer Value Decay by Recency

### ❓ Business Question  
**How does customer value deteriorate as customers become inactive?**

---

<p align="center">
  <img src="Dashboard_Screenshots/05_Customer_Dashboard/Customer_Value_Decay.png">
</p>

### ⭐ Key Insights
- **CLTV drops sharply** from active to dormant customers, confirming strong dependency on recent engagement.
- AOV remains **high in the dormant segment**, likely driven by a small number of large purchases.
- The **largest customer group is dormant (>365 days)**, signaling substantial reactivation opportunity.
- Recent and active customers form the **smallest but highest-value** segments.

### 💡 Action Recommendations
- Launch **tiered win-back campaigns** (email, SMS, incentives) for dormant/lapsed customers.
- Build **automated recency-triggered journeys** to reduce decay in the 31–180 day segments.
- Identify **dormant high-AOV outliers** and target them with premium offers to reactivate high-value potential.
- Use CLTV decay curves to **prioritize retention resources** toward customers with higher predicted lifetime value.

---

---

## 🔄 E. Customer Acquisition & Retention Trends (2016–2021)

### ❓ Business Question  
**How have acquisition, active users, and returning customers evolved over time?**

---

<p align="center">
  <img src="Dashboard_Screenshots/05_Customer_Dashboard/Acquisition_Retention.png">
</p>

### ⭐ Key Insights
- **2019 was the all-time high** for active and returning customers. Number of new customers peaked in 2018 and almost matched it in 2019.
- 2020–2021 show a **sharp contraction**, with 2021 dropping to near-baseline levels.
- Active customers fell from **6,500 → 400** in two years.
- New customer acquisition crashed from **3,000 → 200**.
- Returning customers followed a similar decline pattern, indicating weakened loyalty.

### 💡 Action Recommendations
- Rebuild the acquisition engine with **paid ads, referrals, partnerships, and SEO-content funnels**.
- Deploy **win-back and loyalty programs** to restore retention among mid-life and senior users.
- Audit **what worked in 2018–2019** and revive best-performing campaigns.
- Create **personalized remarketing journeys** to improve returning customer conversion rates.

---

---

## 📊 F. Customer Retention Cohort Analysis

### ❓ Business Question  
**How well do customer cohorts retain over time, and which periods show the strongest/worst retention?**

---

<p align="center">
  <img src="Dashboard_Screenshots/05_Customer_Dashboard/Cohort_Analysis.png">
</p>

### ⭐ Key Insights
- Most cohorts decline below **2% retention after early periods**, indicating weak long-term engagement.
- **2016–2018 cohorts** show several high-retention streaks (**7–14%** in some periods).
- **2020–2021 cohorts are the weakest**, heavily impacted by business disruptions or poor onboarding.
- High-performing cohorts correlate with **successful campaigns or releases**.
- Retention decay is consistent across periods, confirming systemic lifecycle gaps.

### 💡 Action Recommendations
- Analyze strong cohorts to identify repeatable **success drivers** (products, campaigns, onboarding).
- Strengthen **onboarding flows, lifecycle messaging, and loyalty programs** to slow churn.
- Closely track newer cohorts and intervene early to prevent ongoing decay.

---

---

## 🔍 G. RFM Segmentation (Recency–Frequency–Monetary)

### ❓ Business Question  
**Which customer clusters hold the highest potential for retention, reactivation, and value growth?**

---

<p align="center">
  <img src="Dashboard_Screenshots/05_Customer_Dashboard/RFM_Segmentation.png">
</p>

### ⭐ Key Insights
- **Dormant customers (>365 days)** form the largest segment, mostly with **1–3 lifetime purchases**.
- **Active and Recent** customers show the highest frequency and highest monetary scores.
- High-frequency buyers (10+ orders) are rare and **clustered exclusively** among Active/Recent groups.
- Median customer recency is **427 days**, confirming portfolio-wide engagement challenges.

### 💡 Action Recommendations
- Double down on **Active/Recent** users with loyalty perks and premium engagement.
- Launch **win-back campaigns** for Lapsed and At-Risk customers (free shipping, discounts).
- Develop reactivation flows for Dormant users based on AOV-based incentives.
- Create **frequency acceleration campaigns** (add-on bundles, product reminders).
- Integrate **RFM scoring** into CRM to enable automated hyper-targeted retention, reducing churn.

---

## 🏁 **Act 3 Summary**

Customer analysis shows a business heavily reliant on **senior and middle-aged customers**, with **shrinking active users**, strong **AOV and CLTV**, but significant **acquisition and retention weaknesses**.  
The biggest growth levers lie in **reactivation**, **youth-segment outreach**, **lifecycle marketing**, and strengthening **high-value cohorts**.

---

# 🟦 **ACT 4 — Regional Performance Analysis (Initial Section)**

---

## 📸 Region Dashboard — Full View  

> **🔎 Click a link below to view each full dashboard page:**

- **📄 Page 1:** [Open Image](Dashboard_Screenshots/06_Region_Dashboard/Regional_Performance_1.jpg)
- **📄 Page 2:** [Open Image](Dashboard_Screenshots/06_Region_Dashboard/Regional_Performance_2.jpg)
- **📄 Page 3:** [Open Image](Dashboard_Screenshots/06_Region_Dashboard/Regional_Performance_3.jpg)
- **📄 Page 4:** [Open Image](Dashboard_Screenshots/06_Region_Dashboard/Regional_Performance_4.jpg)
- **📄 Page 5:** [Open Image](Dashboard_Screenshots/06_Region_Dashboard/Regional_Performance_5.jpg)

---

## 📌 KPI Summary

<p align="center">
  <img src="Dashboard_Screenshots/06_Region_Dashboard/KPI_Cards_2021_Region.png">
</p>

| **KPI** | **Value / Insight** | **Recommended Action** |
|--------|----------------------|--------------------------|
| **Total Revenue (YTD)** | **$1.04M**, **–88.8% vs PY**, severe market-wide drop. | Diagnose region-level collapse; target recovery zones. |
| **Total Profit (YTD)** | **$606.57K**, **58.56% margin**, stable. | Focus on volume rebuild. |
| **Revenue per sq meter** | **$10.28** (2021), down from **$551.09** when all years selected. | Review space utilization and store-level productivity. |
| **Revenue per store** | **$15.01K** (2021), vs **$805.06K** historically. | Deep-dive underperforming store clusters. |
| **Local Revenue Growth** | **–89.01%**, heavy contraction. | Rebuild local demand and channel presence. |
| **Currency Impact** | **0.21%**, negligible FX effect. | FX not a contributor to downturn. |

---
