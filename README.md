📌 **Customer 360 & RFM Segmentation Analysis**
End-to-end Customer 360 project applying SQL Azure, RFM modeling, VBA automation, and Power BI dashboards to analyze customer behavior and segmentation.
**SQL Azure • VBA Automation • Power BI Dashboard**

🔍 **1. Project Overview**
This project implements an end-to-end Customer 360 analytical pipeline using the RFM model (Recency–Frequency–Monetary) to segment customers and uncover behavioral insights.

💡 **2. Components of the Pipeline**

2.1 SQL Azure (T-SQL)
Data cleaning & preprocessing
RFM metric calculation (Recency, Frequency, Monetary)

2.2 VBA Automation
Auto-assigns RFM segments
Final segmentation refined manually for accuracy
Outputs 5 customer groups: VIP, Loyal, Potential, At Risk, Lost

2.3 Power BI Dashboard
Includes:
Customer overview
RFM segmentation charts
Heatmaps (R×F, R×M, F×M)
Scatter plots exploring RFM relationships
Behavior & revenue insights

2.4 PDF Report
Full methodology
Heatmap interpretations
RFM insights
Marketing strategy recommendations

🧰 **3. Tech Stack**
SQL Azure (T-SQL) – RFM metric generation & preprocessing
VBA – Automated segmentation logic (little manual adjustment after that) 
Power BI – Dashboard visualization
Excel/CSV – Raw data input
PDF – Final analytical report

📁 **4. Folder Structure**
customer-360-rfm-analysis/
│
├── data/
│     ├── customer_transaction.csv
│     ├── customer_registered.csv
│     └── segmentation_rfm.xlsx        # distinct RFM codes + manual segmentation validation
│
├── code/
│     ├── rfm_calculation.sql          # SQL Azure script for R/F/M metrics
│     └── rfm_segmentation.bas         # VBA script for automated segmentation (pre-adjustment)
│
├── customer360_dashboard.pbix         # Power BI Dashboard: https://drive.google.com/drive/folders/1kMQsT0sWNI8yeDNsUkafuIdG8JQpnjgK
├── Customer360_RFM_Report.pdf         # Final project report
│
└── README.md

📊 **5. Key Features**

✔ 1. Data Consolidation
Customer data from registration & transactions is unified into a 360-degree analytical dataset.

✔ 2. RFM Calculation (SQL Azure)
Recency – days since last purchase
Frequency – normalized transaction count
Monetary – normalized GMV
Stored in segmentation_rfm.xlsx to validate distinct RFM codes.

✔ 3. Automated Segmentation (VBA)
VBA assigns customers to 5 groups based on the RFM score:
VIP, Loyal, Potential, At Risk, Lost

✔ 4. Power BI Dashboard
Includes:
Customer overview
RFM heatmaps
Segmentation breakdown
Scatter plots for R–F–M relationships
Revenue & behavior insights

✔ 5. Insights Summary
Potential & At Risk are the largest groups
Loyal customers produce the highest average spending
VIP group is small but high-value
Lost customers show strong win-back potential
Behavioral scatter plots highlight clear value tiers

🎯 Business Recommendations

At Risk: reminder notifications, 7-day comeback offers
Lost: low-cost "Come-back Pack" with curated titles
Potential: soft upsell, 10% off the second weekly purchase
Loyal/VIP: early access, personalized perks, tier-upgrade programs
Reduce wasted marketing budget using segmentation-based targeting

📎 Appendix

All SQL and VBA code is included inside the /code folder.
The segmentation_rfm.xlsx file stores distinct RFM key combinations used to generate segment assignments.
## 📁 Large Files (stored externally due to GitHub size limits)
- **Customer360 Power BI Dashboard (.pbix)**  
  🔗 https://drive.google.com/file/d/xxxxx/view?usp=sharing

👤 Author
Nguyen Khanh Nhat
📍 Phu Thuan Ward, Ho Chi Minh City
📞 +84 707 701 783
