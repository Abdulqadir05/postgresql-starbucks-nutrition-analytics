```html
<div align="center">

<h1>☕ Starbucks Nutrition Analytics System</h1>

<p>
  <img src="https://img.shields.io/badge/PostgreSQL-18-blue?style=for-the-badge&logo=postgresql">
  <img src="https://img.shields.io/badge/SQL-Advanced-success?style=for-the-badge">
  <img src="https://img.shields.io/badge/PLpgSQL-Procedures%20%26%20Triggers-orange?style=for-the-badge">
  <img src="https://img.shields.io/badge/Analytics-Business%20Intelligence-purple?style=for-the-badge">
  <img src="https://img.shields.io/badge/Status-Completed-brightgreen?style=for-the-badge">
</p>

<h3>Advanced PostgreSQL Database Project for Starbucks Beverage Nutrition Analytics</h3>

<p>
Developed by <strong>Abdul Qadir</strong><br>
BS Applied AI & Data Science | IIT Jodhpur
</p>

</div>

<hr>

<h2>📖 Project Overview</h2>

<p>
The Starbucks Nutrition Analytics System is an advanced PostgreSQL-based database project designed to analyze beverage nutrition, caffeine content, calorie distribution, health scores, and recommendation systems using SQL and PL/pgSQL.
</p>

<p>
The project demonstrates real-world database development concepts including:
</p>

<ul>
<li>Relational Database Design</li>
<li>Data Validation</li>
<li>Business Intelligence Reporting</li>
<li>Advanced SQL Analytics</li>
<li>Window Functions</li>
<li>Views</li>
<li>Stored Procedures</li>
<li>Functions</li>
<li>Triggers</li>
<li>Recommendation Systems</li>
</ul>

<hr>

<h2>🎯 Project Objectives</h2>

<ul>
<li>Design a normalized Starbucks beverage database</li>
<li>Store detailed nutrition information</li>
<li>Generate business insights through SQL analytics</li>
<li>Create reusable reporting views</li>
<li>Implement automation using triggers</li>
<li>Develop recommendation systems using PL/pgSQL</li>
<li>Demonstrate advanced PostgreSQL capabilities</li>
</ul>

<hr>

<h2>🏗️ Database Architecture</h2>

<h3>Core Tables</h3>

<table>
<tr>
<th>Table</th>
<th>Description</th>
</tr>

<tr>
<td>Categories</td>
<td>Stores beverage categories</td>
</tr>

<tr>
<td>Beverages</td>
<td>Stores beverage information and preparation types</td>
</tr>

<tr>
<td>Nutrition Facts</td>
<td>Stores nutritional metrics for each beverage</td>
</tr>
</table>

<br>

<h3>Database Relationships</h3>

<pre>
Categories
    │
    └── Beverages
            │
            └── Nutrition Facts
</pre>

<p>
Implemented using:
</p>

<ul>
<li>Primary Keys</li>
<li>Foreign Keys</li>
<li>Referential Integrity</li>
<li>Cascading Relationships</li>
</ul>

<hr>

<h2>⚡ SQL Features Implemented</h2>

<h3>DDL Operations</h3>

<ul>
<li>CREATE TABLE</li>
<li>CREATE VIEW</li>
<li>CREATE FUNCTION</li>
<li>CREATE PROCEDURE</li>
<li>CREATE TRIGGER</li>
</ul>

<h3>Advanced SQL</h3>

<ul>
<li>Window Functions (RANK)</li>
<li>Common Table Expressions (CTEs)</li>
<li>Correlation Analysis</li>
<li>Statistical Aggregations</li>
<li>Business Intelligence Queries</li>
</ul>

<hr>

<h2>📊 Business Intelligence & Reporting</h2>

<h3>Reports Generated</h3>

<ul>
<li>Top Calorie Beverages</li>
<li>Low Calorie Beverages</li>
<li>High Protein Drinks</li>
<li>Caffeine Rankings</li>
<li>Category Nutrition Analysis</li>
<li>Seasonal Beverage Recommendations</li>
<li>Healthy Beverage Recommendations</li>
<li>Milk Type Comparison</li>
</ul>

<hr>

<h2>👁️ Views Created</h2>

<ul>
<li><strong>vw_beverage_nutrition</strong></li>
<li><strong>vw_low_calorie_beverages</strong></li>
<li><strong>vw_high_protein_beverages</strong></li>
<li><strong>vw_caffeine_ranking</strong></li>
<li><strong>vw_category_summary</strong></li>
<li><strong>vw_seasonal_recommendations</strong></li>
<li><strong>vw_nutrition_report</strong></li>
<li><strong>vw_healthy_choices</strong></li>
</ul>

<hr>

<h2>🧠 PL/pgSQL Functions</h2>

<h3>fn_get_beverage_nutrition()</h3>

<p>
Returns detailed nutritional information for beverages.
</p>

<h3>fn_health_score()</h3>

<p>
Calculates beverage health score using:
</p>

<ul>
<li>Calories</li>
<li>Sugar</li>
<li>Protein</li>
<li>Fat</li>
</ul>

<h3>fn_recommend_by_calories()</h3>

<p>
Generates beverage recommendations within a specified calorie budget.
</p>

<hr>

<h2>⚙️ Stored Procedures</h2>

<h3>sp_add_beverage()</h3>

<ul>
<li>Automatically creates categories</li>
<li>Adds beverages</li>
<li>Stores nutrition information</li>
</ul>

<h3>sp_update_nutrition()</h3>

<ul>
<li>Updates nutrition records</li>
<li>Maintains data consistency</li>
</ul>

<hr>

<h2>🚀 Triggers</h2>

<h3>Automatic Timestamp Trigger</h3>

<p>
Automatically updates timestamps whenever nutrition data changes.
</p>

<h3>Nutrition Validation Trigger</h3>

<p>
Prevents:
</p>

<ul>
<li>Negative Calories</li>
<li>Negative Sugar Values</li>
<li>Negative Caffeine Values</li>
</ul>

<hr>

<h2>📈 Advanced Analytics</h2>

<ul>
<li>Correlation Analysis</li>
<li>Nutrition Clustering</li>
<li>Median & Distribution Analysis</li>
<li>Caffeine Efficiency Analysis</li>
<li>Seasonal Beverage Recommendations</li>
<li>Health Score Ranking</li>
</ul>

<hr>

<h2>🛠️ Technologies Used</h2>

<table>
<tr>
<th>Technology</th>
<th>Purpose</th>
</tr>

<tr>
<td>PostgreSQL 18</td>
<td>Database Management</td>
</tr>

<tr>
<td>SQL</td>
<td>Query Development</td>
</tr>

<tr>
<td>PL/pgSQL</td>
<td>Functions & Procedures</td>
</tr>

<tr>
<td>pgAdmin 4</td>
<td>Database Administration</td>
</tr>

<tr>
<td>GitHub</td>
<td>Version Control</td>
</tr>
</table>

<hr>

<h2>💡 Skills Demonstrated</h2>

<ul>
<li>Database Design</li>
<li>Relational Modeling</li>
<li>SQL Development</li>
<li>PostgreSQL Administration</li>
<li>Data Validation</li>
<li>Business Intelligence</li>
<li>Window Functions</li>
<li>Stored Procedures</li>
<li>Functions</li>
<li>Triggers</li>
<li>Advanced Analytics</li>
<li>Statistical SQL</li>
</ul>

<hr>

<h2>🎓 Learning Outcomes</h2>

<p>
This project provided practical experience in:
</p>

<ul>
<li>Advanced PostgreSQL Development</li>
<li>Business Analytics</li>
<li>Data Engineering Concepts</li>
<li>Database Administration</li>
<li>Recommendation Systems</li>
<li>Query Optimization</li>
<li>Nutrition Data Analysis</li>
</ul>

<hr>

<h2>🔮 Future Enhancements</h2>

<ul>
<li>Machine Learning Recommendation Engine</li>
<li>Power BI Dashboard</li>
<li>Tableau Dashboard</li>
<li>REST API Integration</li>
<li>Customer Preference Analytics</li>
<li>Predictive Nutrition Modeling</li>
</ul>

<hr>

<h2>👨‍💻 Author</h2>

<p>
<strong>Abdul Qadir</strong><br>
BS Applied AI & Data Science<br>
Indian Institute of Technology Jodhpur
</p>

<h3>Connect With Me</h3>

<ul>
<li>💼 LinkedIn: https://www.linkedin.com/in/abdul-qadir-533827318/</li>
<li>🐙 GitHub: https://github.com/Abdulqadir05</li>
<li>📧 Email: perfectqadir691@gmail.com</li>
</ul>

<hr>

<div align="center">

<h2>⭐ Project Status</h2>

<h3>Completed Successfully</h3>

<p>
Advanced PostgreSQL Analytics Project demonstrating Database Design, SQL Development, Business Intelligence, PL/pgSQL Programming, Stored Procedures, Functions, Triggers, and Nutrition Analytics.
</p>

</div>
```
