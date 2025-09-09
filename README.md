# Table of Contents
- [Project Background](#project-background)
- [Executive Summary](#executive-summary)
- [Insights Deep-Dive](#insights-deep-dive)
  - [Sales and Order Trends](#sales-and-order-trends)
  - [Product Performance](#product-performance)
  - [Customer Trends](#customer-trends)
  - [Payment Trends](#payment-trends)
  - [Seller Trends](#seller-trends)
  - [Regional Trends](#regional-trends)
  - [Delivery Performance](#delivery-performance)
  - [Reviews & Satisfaction](#reviews--satisfaction)
- [Recommendations](#recommendations)
- [Questions, Assumptions, and Caveats](#questions-assumptions-and-caveats)
- [Next Steps](#next-steps)
- [Tools & Stack](#tools--stack)
- [References](#references)

# Project Background
Olist, founded in 2015, is an SMB commerce enabler ecosystem specializing in logistics and capital. As Brazil’s largest online marketplace, it connects thousands of small businesses to customers nationwide. This project is framed from an operations perspective, extracting insights and delivering recommendations that highlight opportunities to improve sales growth, customer satisfaction, and operational efficiency.

# Executive Summary
Olist’s sales analysis of 100k orders from 2016–2018 shows revenue stabilizing at around R$1M per month by 2018, following a sharp growth surge in 2017 driven by Black Friday (+53%). Health & Beauty, Bed/Bath/Table, and Watches & Gifts account for much of total revenue, while high-ticket items such as Computers and Appliances generate outsized returns despite lower volume. Customer growth trends matches sales, but retention remains low as most buyers purchase only once, with demand mostly concentrated within the Southeast region. Average delivery times of 12.5 days and higher lateness in the North/Northeast continue to impact satisfaction, though overall ratings remain positive (~4 stars). Main opportunities occur in replicating seasonal sales success, expanding regional reach, and strengthening loyalty to drive long-term growth. 

# Insights Deep-Dive

## Sales and Order Trends
- Revenue reached R$15.4M, with 2017 as the breakout year and Black Friday (+53%, 7.3k orders) driving the sharpest spike.
- By 2018, sales stabilized at ~R$1M and 6–7k orders monthly, showing Olist reached a higher baseline.
- The average order value (AOV) stayed mostly stable at R$145–170, but spiked during the early months and again at Black Friday 2017 (R$241) before returning to its usual range.
- Credit cards drove the highest AOV (~R$163), while boletos, vouchers, and debit cards trailed behind.

Olist quickly scaled in 2017 and achieved a higher revenue baseline, but growth plateaued, signaling the need to create new demand beyond seasonal peaks such as Black Friday.

## Product Performance
Sales are spread across many categories, but Health & Beauty, Watches & Gifts, and Bed/Bath/Table lead with each generating ~R$1M in revenue.
    - Bed/Bath/Table: largest order volume (9.4k) but lower average price (~R$93).
    - Watches & Gifts: fewer orders (5.6k) but higher price (~R$201).
    - Health & Beauty: strong order volume (8.8k) plus higher pricing (~R$130).
    - These 3 categories show that most everyday home essentials have consistent sales power.
- Several mid-sized categories (Sports & Leisure, Computers, Furniture & Décor) also perform well. 
- The top 10 categories account for R$8.48M (~55% of total revenue), showing that a slice of the catalog drives the most sales. 
- Olist's overall AOV is R$160. 
- In the category level, some categories stand out for much higher AOVs:
    - Computers (R$1,232), Appliances (R$484–633), and Musical Instruments (R$305).
    - While order counts are smaller, these high-value segments generate disproportionately large revenue per sale.
- At the product level, Health & Beauty leads, with two items earning >R$50k each.
- High-value products like Computers (R$49k from 35 orders) and Baby products (R$39k from 38 orders) also appear in the top 10, while Bed/Bath/Table and Furniture & Décor contribute through volume.

Everyday essentials like Health & Beauty and Bed/Bath/Table keep the platform stable, while high-value categories like Computers and Appliances show big potential for profit. 

## Customer Trends
- Customer density looks similar to revenue concentration by state.
    - São Paulo leads with 16k customers, followed by Rio de Janeiro (5.1k) and Minas Gerais (4.5k). 
    - Southern states like Rio Grande do Sul, Paraná, and Santa Catarina add another ~5.4k. 
    - Northern states like Amazonas, Acre, Amapá, and Roraima together account for fewer than 150 customers total.
- Customer acquisition peaked in late 2017 and settled into a consistent baseline through 2018.
- Many customers appear to be one-time buyers. Growth in customer base has been from scale, not repeat engagement and/or purchases. 
- Cancellation rates are generally low across all categories, averaging just 1.2% overall.
    - DVDs/Blu-ray (3.1%), construction safety tools (2.6%), and diapers & hygiene (2.6%) see slightly higher rates.
    - Toys, fashion, and auto remain under 1%, suggesting more reliable fulfillment.

Olist is great at getting new customers, but most only buy once. A higher customer retention combined with new customers will allow the platform to grow.

## Payment Trends
- Credit cards are the dominant payment method, used in 74% of all purchases.
- Boletos make up 19% of payments.
- Vouchers are minor at 5.6%, while debit cards are barely used (1.5%).
- Payment behavior varies slightly by product category, but the overall pattern holds:
    - Credit cards dominate across nearly all product categories, usually covering 70–80% of purchases. 
    - Boletos are most common in higher-value categories like Computers & Accessories (27%) and Office Furniture (27%)
    - Vouchers appear more often in books and fashion (~5–10%). 
    - Debit cards remain negligible across the board.
- Payment behavior also vary by region:
    - São Paulo and Rio de Janeiro, credit cards account for about 74% of purchases.
    - Less urban states rely more heavily on boletos, reaching 25–28% of transactions in places like Maranhão, Mato Grosso, and Tocantins.
    - Roraima is an extreme case, where 42% of payments are boletos.

Overall, most people pay by credit card, but in smaller states a lot still use boletos. Payment habits aren’t the same everywhere, so it's important to ensure a seamless payment process.  

## Seller Trends
- The number of active sellers grew rapidly in 2017, peaking at nearly 940 in Nov ’17, before stabilizing between 950–1,250 sellers per month throughout 2018. 
- Growth percentages shrank over time as the number of sellers leveled off instead of continuing to climb.
- Top sellers each generated ~R$130k–227k in revenue, but given the anonymized IDs, seller-level insights are limited.
- The top revenue-generating sellers are spread across both everyday categories (Watches & Gifts, Bed/Bath/Table) and higher-value categories (Computers, Office Furniture).

Overall, new sellers grew quickly in 2017 and then flattened out. This shows Olist reached a peak in attracting new sellers, and future growth depends more on helping existing sellers sell more rather than just signing up new ones.

## Regional Trends
- Both revenue and customer density are highly concentrated in the Southeast, especially São Paulo, Rio de Janeiro, and Minas Gerais. 
- Northern and Northeastern states remain underrepresented, and those regions also face higher delivery delays. 
- São Paulo (SP) dominates with R$2.2M (~13.8% of total revenue). This is then followed up by Rio de Janeiro (RJ, 5.2%) and Minas Gerais (MG, 4.4%). These top 3 states contribute to ~23% of all revenue. 
- Southern states (RS, PR, SC) contribute another 5-6%.
- North & Northeast states (e.g., AM, AC, RR, AP) barely contribue to the revenue (<0.1% each).

Most sales and customers are concentrated in the Southeast, especially São Paulo. Other regions buy far less, potentially because of delivery limits, making it hard to serve those areas well.

## Delivery Performance
- The average delivery time was 12.5 days  with 8.1% of orders arriving late. 
- Order cancellations were low at just 1.2%, showing that most purchases were successfully fulfilled.
- In most regions, longer delivery times correlate with lower review scores. 
    - For example, Roraima (25 days) and Maranhão (21 days) both average below 3.9. 
    - However, Amazonas (27 days) still maintained a score of 4.39,
- On-time vs. late delivery tracking shows lateness scaling up with order growth, especially during peak months.
- By state, lateness was most severe in the North/Northeast: Alagoas and Maranhão saw over 20% of orders arrive late, compared to just 5–6% in São Paulo and Minas Gerais.

Long delivery times, especially in the North and Northeast, are one of the biggest problems and it often leads to lower satisfaction.

## Reviews & Satisfaction
- Review distribution is skewed positively: nearly 6 in 10 reviews are 5 stars, generating ~58% of total revenue. 
- Another ~19% of revenue comes from 4-star reviews, meaning about three-quarters of Olist’s sales are tied to high satisfaction.
- Interestingly, 1-star orders still make up ~12% of revenue (R$1.8M), and their average order value (~R$184) is about 20% higher than for 5-star orders. 
    - This suggests unhappy customers are often higher spenders.
- Lower satisfaction is especially evident in remote regions with higher delivery delays, pointing to logistics challenges as a key driver of poor reviews.

Overall, most buyers leave 4–5 star reviews, which means the overall shopping experience is positive. But the smaller group of unhappy customers is costly, since their orders are usually higher in value than average.

# Recommendations

## Sales Trends
1) Replicate successful Black Friday promotions by planning seasonal marketing campaigns. Several ways to do this include discounts and flash sales. This can also be used to improve revenue on low-performing product categories. 
- Running mid-year sales events (June-July) also helps to reduce dependence on Q4 peaks. 
2) Increase average order value by bundling complementary products and promoting add-ons during checkout. Something similar to a “Add [recommended item] before you check out!”
## Product Performance
1) Expand leading categories like Health & Beauty, Watches & Gifts, and Bed, Bath & Table by onboarding more sellers and increasing stock availability.
2) Lean into high-value categories like Computers and Appliances by spotlighting them in campaigns, financing options, and premium product showcases.
3) Monitor product performance closely to identify “hidden gems” in mid-sized categories (Sports & Leisure, Furniture & Décor) that could grow with more promotion.
## Customer Trends
1) Improve retention by introducing loyalty programs, cashback offers, or personalized coupons to encourage repeat purchases.
2) Grow presence in underrepresented regions with localized marketing campaigns and partnerships with regional sellers.
3) Segment customers by purchase frequency and spend to send tailored recommendations (e.g., high-value customers receive exclusive offers). 
4) Acquisition can be boosted through referrals by rewarding customers who bring in new users. An example of this could be through a “Refer a Friend” program where both referrer and the new user both receive a discount or coupon on their next purchase. 
## Payment Trends
1) Maintain credit card dominance but expand alternative options (installments, Pix, mobile wallets) to reach younger and less urban buyers.
2) Make boletos more user-friendly by adding reminders or easier redemption steps, supporting shoppers in regions where they’re still common.
## Seller Trends
1) Support existing sellers with training, analytics dashboards, and fulfillment guidance to help them scale, rather than just onboarding new ones.
2) Highlight and reward top-performing sellers (e.g., “Preferred Seller” badges) to boost trust and drive more sales through them.
3) Encourage diversity in seller mix by recruiting niche and regional sellers to broaden the catalog.
## Regional Growth:
1) Prioritize expansion beyond the Southeast by combining localized campaigns with logistics improvements.
2) Partner with regional delivery services to strengthen customer base where Olist has less presence. 
## Delivery Performance
1) Reduce late deliveries in North/Northeast by partnering with regional couriers who specialize in remote areas. 
2) Delivery times can also be shortened by setting up distribution hubs closer to high-delay states. 
## Reviews & Satisfaction
1) Maintain high review scores by monitoring seller service levels and enforcing quality standards.
2) Leverage positive reviews in marketing (e.g., “Rated 4.1 stars by 100k+ customers”) to build trust with new buyers.
3) Address negative reviews by reviewing low-score feedback, identifying recurring issues (e.g., delivery or product mismatch), and passing them back to sellers as corrective actions.

# Questions, Assumptions, and Caveats
## Questions
**Logistics**: 
- Are delivery delays in the North and Northeast more tied to shipping distance or seller handling time?
- How are courier partnerships chosen, and do we have service-level agreements (SLAs) in place for on-time delivery?
- What would it take to set up regional hubs in the North/Northeast?

**Marketing**: 
- Were there any specific campaigns that drove the Black Friday 2017 spike and were similar efforts attempted at a later time?
- Do we run localized promotions for regions outside the Southeast?

**Customer Experience**: 
- What are the most common themes in low star reviews? Can they be tied back to mostly logistics or product performance? 
- Are refunds and cancellations logged separately from reviews?

**Payments/Finance**:
- Are installment payments (parcelados) tracked separately in the system?

**Seller Management**:
- What support or training do we provide to sellers to help them improve service levels?
- Are there quality controls in place for product listings and fulfillment times?

**Product/Category Teams**:
- How are categories prioritized for promotions?
- Do we track stock-outs or unavailable items that might limit sales in popular categories?

## Assumptions and Caveats
**Potential Missing Data**: Early and late months in the dataset are partial and less reliable for trend analysis.

**Delivery Timestamps**: Delivery lateness is calculated from timestamp differences; reporting errors may exist.

**Repeat Purchases**: The data suggests that no customers made repeat purchases.
    - This may be due to the dataset's limits, but it would be a major concern for customer loyalty if true. 

**Product Coverage**: Some categories have very few orders, so averages (AOV) may be unreliable.

# Next Steps
**Dig deeper into retention**: Explore why customers aren’t making repeat purchases and test loyalty-building strategies.

**Refine regional strategy**: Investigate specific barriers in the North/Northeast (e.g., courier coverage, costs) to guide future expansion.

**Enrich review analysis**: Run text mining on review comments to better understand themes behind low scores.

**Track financial impact**: Link cancellations, refunds, and negative reviews to lost revenue to quantify business risk.

**Expand dataset**: Incorporate more recent years (2019–2025) to see if trends have shifted post-2018.


# Tools & Stack
Python: Mainly Pandas, NumPy, Matplotlib, Seaborn for data cleaning, analysis, and visualization

SQL: MySQL/Postgres for querying and aggregating data

Tableau: Interactive dashboards for sales, customers, delivery, and reviews

# References
Dataset: Brazilian E-Commerce Public Dataset by Olist (Kaggle)



