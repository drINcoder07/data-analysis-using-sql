#### PROJECT 1 - CRM SALES OPPORTUNITIES

## PROJECT OVERVIEW

### SOURCE OF DATA
The data comes from one of the data challenges offered by Maven Data Analytics entitled "Maven Sales Challenge". It includes a B2B sales pipeline data from a fictitious company that sells computer hardware, including information on accounts, products, sales teams, and sales opportunities.

### Recommended Analysis
Here are the recommended insights to uncover from the datasets:
- How is each sales team performing compared to the rest?
- Are any sales agents lagging behind?
- Can you identify any quarter-over-quarter trends?
- Do any products have better win rates?


### ANALYSIS

#### Sales Teams Analysis
| regional_office | manager |  won_deals | won_deals_value | engaging_deals | lost_deals | prospecting_deals | win_pct |
| ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- |
| Central   | Melvin Marxen     | 882 | 2251930 | 215 | 536 | 296 | 62.20 |
| West      | Summer Sewald     | 828 | 1964750 | 414 | 459 | 0 | 64.34 |
| Central   | Dustin Brinkmann  | 747 | 1094363 | 193 | 439 | 204 | 62.98 |
| East      | Rocco Neubert     | 691 | 1960545 | 214 | 422 | 0 | 62.08 |
| West      | Celia Rouche      | 610 | 1603897 | 334 | 352 | 0 | 63.41 |
| East      | Cara Losch        | 480 | 1130049 | 219 | 265 | 0 | 64.43 |

##### Insights:
- Manager Melvin Marxen's team from Central Office brought many deals won (882) and highest total value from won deals (2251930). The team also have the most lost deals (536) and the most prospects (296).
- Although Cara Losc's team from East office has the lowest won deals and value, it has the highest win percentage for totals won and lost deals (64.34 %).
- Summer Sewald's team from the West office are the most engaging of all teams as of the moment (414 counts).


#### TOP Sales Agent by Total Value of Won deals
| regional_office | manager | sales_agent | won_deals | value_won_deals |
| ----------- | ----------- | ----------- | ----------- | ----------- |
| Central | Melvin Marxen | Darcel Schlecht | 349 | 1153214 |

#### TOP Sales Agent by Percentage of Won Deals vs Lost Deals
| regional_office | manager | sales_agent | won_deals_pct | lost_deals_pct |
| ----------- | ----------- | ----------- | ----------- | ----------- |
| West | Celia Rouche | Hayden Neloms | 70.39 | 29.61 |

#### Sales Agent most number of engaging deals
| regional_office | manager | sales_agent | engaging_deals | 
| ----------- | ----------- | ----------- | ----------- |
| West | Celia Rouche | Vicki Laflamme | 104 |

#### Sales Agent with the most prospects 
| regional_office | manager | sales_agent | prospecting_deals | 
| ----------- | ----------- | ----------- | ----------- |
| Central | Melvin Marxen | Darcel Schlecht | 110 | 

#### Sales Agents Lagging Behind
| regional_office | manager | sales_agent | won_deals | engaging_deals | lost_deals | prospecting_deals | 
| ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- |
| Central | Melvin Marxen | Mei-Mei Johns | 0 | 0 | 0 | 0 | 
| East | Rocco Neubert | Natalya Ivanova | 0 | 0 | 0 | 0 | 
| East | Cara Losch | Elizabeth Anderson | 0 | 0 | 0 | 0 | 
| West | Summer Sewald | Carl Lin | 0 | 0 | 0 | 0 | 
| West | Celia Rouche | Carol Thompson | 0 | 0 | 0 | 0 | 

#### QUARTER-OVER-QUARTER TRENDS

| year | quarter | won_deals | lost_deals | total_close_value
| ----------- | ----------- | ----------- | ----------- | ----------- | 
| 2017 | 1 | 531 | 116 | 1134672 |
| 2017 | 2 | 1254 | 778 | 3086111 |
| 2017 | 3 | 1257 | 790 | 2982255 |
| 2017 | 4 | 1196 | 789 | 2802496 |


##### Insights:
- Most won deals occurred on the third quarter of 2017 (1257) as well as the most count of lost deals (790). First quarter has the lowest in both categories.
- Trend starts lowest in first quarter, leaps high to second and peaks at third, then lowers at the fourth quarter.
- Second Quarter has the highest revenue from deals (3086111).

#### PRODUCTS ANALYSIS

| product | won_deals | won_deals_pct | total_close_value |
| ----------- | ----------- | ----------- | ----------- | 
| MG Special | 793 | 64.84 | 43768 |
| GTX Plus Pro | 479 | 64.30 | 2629651 |
| GTX Basic | 915 | 63.72 | 499263 |
| GTXPro | 729 | 63.56 | 3510578 |
| GTX Plus Basic | 653 | 62.13 | 705275 |
| MG Advanced  | 654 | 60.33 | 2216387 |
| GTK 500 | 15 | 60.00 | 400612 |

##### Insights:
- GTX Basic has the most won deals (915).
- MG Special has the highest win percentage vs won and lost deals combined (64.84 %)
- GTX Pro has the highest Total Close Value (3,510,578).


#### SECTOR AND ACCOUNTS ANALYSIS

#### Top 5 Accounts with most won deals
| account | sector | office_location | won_deals |
| ----------- | ----------- | ----------- | ----------- |
| Kan-code | software | United States | 115 | 
| Hottechi | technology | Korea | 111 | 
| Konex | technology | United States | 108 | 
| Condax | medical | United States | 105 | 
| Rangreen | technology | Panama | 75 |
| ......... | ......... | ......... | ......... |
| Sumace | retail | Romania | 23 |

#### Top 5 Accounts with highest total close value
| account | sector | office_location | total_close_value |
| ----------- | ----------- | ----------- | ----------- |
| Kan-code | software | United States | 341455 | 
| Konex | technology | United States | 269245 | 
| Condax | medical | United States | 206410 |
| Cheers | entertainment | United States | 198020 | 
| Hottechi | technology | Korea | 194957 | 

##### Other Insights:
- Rangreen from Panama has the highest percentage of winning in deals (75 %) vs combined won and lost deals. Statholdings has the least (53.13 %).
- Retail Sector has the highest count of won deals (799), lost deals (468), and highest total close value (1867528). Employment Sector has the lowest win (179) and lost (107) deals, and lowest total close value (436174).
- Marketing has the highest percentage of won vs lost deals (64.85 %) while Finance has the lowest (61.17 %).


### RECOMMENDATIONS:
1. Focus on the Retail Sector as it produces the highest number of won deals and revenue.
2. Promote GTXPro as it has the highest source of revenue from deals.
3. Verify status of lowest performing sales agents.



