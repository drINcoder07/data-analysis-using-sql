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



