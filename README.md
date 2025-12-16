# B2B SaaS Productivity Tool – User Onboarding & Activation Funnel Drop-Off Analysis


## Product Scenario

Product
TaskFlowHQ is a B2B SaaS productivity tool designed to help individuals and teams plan, track, and complete work using structured workflows and tasks.

Users

New users signing up to evaluate whether TaskFlowHQ can help them organize work more effectively and fit into their day-to-day workflow.

Primary Goal

Guide new users from first app open to completing their first meaningful action in the product, ensuring they experience real value early.

User Journey

A new user opens TaskFlowHQ to explore the product.
They move through initial onboarding or setup screens, browse core features to understand what the product offers, and attempt to start working by creating or progressing a task or workflow.
If the user successfully completes this first action, they are considered activated.

What “First Meaningful Action” Means

A first meaningful action represents the moment a user moves from passive exploration to active usage.

In TaskFlowHQ, this corresponds to the user successfully completing a core workflow step, such as finalizing a task or action that demonstrates the product’s value.
This moment indicates that the user understands how the product works and can apply it to their own work.

Business Problem

Although many users open the app and proceed through onboarding, a large proportion fail to reach activation. This drop-off before completing a meaningful action limits adoption, retention, and long-term business impact.

Why Activation Matters

Retention:
Users who experience value early are more likely to return and continue using the product.

Revenue Potential:
Activated users are more likely to upgrade, expand usage, or bring additional team members into the product.

Product–Market Fit:
Difficulty reaching activation often signals unclear value, high friction, or misalignment between user expectations and product design.

### User Funnel Definition

The onboarding and activation journey is modeled as a five-step funnel:

App Open – User opens the application for the first time

Onboarding Screen Viewed – User views initial setup or login screens

Feature Discovery – User explores a core feature of the product

Core Action Started – User initiates a primary workflow or task

Activation – User completes their first meaningful action in the product

---

## KPI Framework

This project evaluates onboarding and activation performance using the following core product KPIs.

### Activation & Conversion KPIs

Activation Rate

Measures the percentage of users who complete their first meaningful action after discovering a feature.

Calculation:
Activated Users ÷ Feature Discovery Users

Result:
9 ÷ 201 = 4.5%

Funnel Conversion Rate

Measures how efficiently users progress between key stages of the onboarding funnel.

App Open → Onboarding: 25.8% (603 ÷ 2339)

Onboarding → Feature Discovery: 33.3% (201 ÷ 603)

Feature Discovery → Activation: 4.5% (9 ÷ 201)

Drop-off Rate by Stage

Identifies where users abandon the onboarding journey.

App Open → Onboarding: 74.2% drop-off

Onboarding → Feature Discovery: 66.7% drop-off

Feature Discovery → Core Action: 100% drop-off

Feature Discovery Rate

Measures the proportion of onboarded users who explore at least one core feature.

Calculation:
Feature Discovery Users ÷ Onboarded Users

Result:
201 ÷ 603 = 33.3%

Time to Activation

Measures how long activated users take to reach activation after onboarding.

Calculation:
Activation Timestamp − Onboarding Timestamp

Purpose:
Used to assess onboarding friction and pacing for users who successfully activate.

### Retention Metrics

### Day 1 Retention
Measures the percentage of onboarded users who return the day after onboarding and generate any event.

- Onboarded Users: 603  
- Day 1 Retained Users: 51  
- Day 1 Retention Rate: **8.5%**

**Interpretation**  
A relatively small share of users return the day after onboarding, suggesting limited early habit formation and reinforcing the need to improve activation clarity and early value delivery.

### Day 3 Retention

Measures the percentage of onboarded users who return three days after onboarding and generate any event.

- Onboarded Users: 603  
- Day 3 Retained Users: 17  
- Day 3 Retention Rate: **2.8%**

**Interpretation**  
Retention drops sharply by Day 3, indicating that most users fail to build a short-term habit after onboarding. This suggests that initial activation alone is not sufficient to sustain engagement, and that the product may lack compelling follow-up value or reminders shortly after first use.

### Day 7 Retention

Measures the percentage of onboarded users who return seven days after onboarding and generate any event.

- Onboarded Users: 603  
- Day 7 Retained Users: 5  
- Day 7 Retention Rate: **0.8%**

**Interpretation**  
Day-7 retention is extremely low, indicating that while a small fraction of users return shortly after onboarding, very few develop sustained engagement over a full week. This suggests weak habit formation and highlights the need for stronger post-activation value reinforcement.


### Pacing & Friction KPIs

- Median Time (Onboarding → Feature Discovery): **74 seconds**
- Median Time (Feature Discovery → Activation): **727 seconds (~12 minutes)**

**Interpretation**  
Users who progress beyond onboarding typically discover a feature quickly, indicating low friction in initial navigation. However, the significantly longer time between feature discovery and activation suggests execution friction, unclear guidance, or insufficient motivation to complete the core action.



---

## Structure

```
taskflowhq-onboarding-activation-funnel-analysis/
│
├── sql/
│   ├── 01_event_validation.sql
│   ├── 02_event_mapping_step2_onboarding.sql
│   ├── 03_event_mapping_step3_feature_discovery.sql
│   ├── 04_user_funnel_construction.sql
│   ├── 05_retention_cohort.sql
│   └── 06_ab_test.sql
│
├── README.md
└── notes/
    └── funnel_notes.md 
```


🔹 Funnel Summary & Drop-off Analysis


This analysis focuses on a single onboarding cohort to preserve clean funnel sequencing. In a production setting, the same framework would be extended across rolling cohorts to monitor retention trends.

User Funnel Overview

Funnel Step	Users
App Open	2339
Onboarding Screen Viewed	603
Feature Discovery	201
Core Action Started	0
Activation	9

Key Observations

Significant drop-off occurs immediately after app open, indicating onboarding friction.

Only ~33% of onboarded users proceed to feature discovery.

No users initiate the core action despite feature exploration.

A small number of users reach activation without recorded core-action events, highlighting instrumentation gaps in the dataset.

| Funnel Step | Users |
|------------|-------|
| App Open | 2339 |
| Onboarding Screen Viewed | 603 |
| Feature Discovery | 201 |
| Core Action Started | 0 |
| Activation | 9 |

| Transition | Conversion Rate | Drop-off Rate |
|-----------|-----------------|---------------|
| App Open → Onboarding | 25.8% | 74.2% |
| Onboarding → Feature Discovery | 33.3% | 66.7% |
| Feature Discovery → Core Action | 0% | 100% |
| Feature Discovery → Activation | 4.5% | 95.5% |


🔹 Segmentation: Activation Speed

To better understand differences among successful users, activated users were segmented based on the time taken to reach activation after onboarding.

Users were classified into:

Fast Activators — users who reached activation quickly after onboarding

Slow Activators — users who required significantly more time to complete activation

Results:

Total Activated Users: 9

Fast Activators: 4 (44%)

Slow Activators: 5 (56%)

Insight:
While all users in this group ultimately activated, a majority required substantially more time to do so. This suggests that the primary friction lies not in value discovery, but in executing the core action efficiently after discovery.

This segmentation highlights opportunities to streamline post-discovery flows and reduce time-to-value for slower users.


🔍 Segment-Level Activation Pacing Analysis

To understand why some users activate slower than others, a segment-level pacing analysis was performed on activated users only, separating them into Fast and Slow Activators based on post–feature discovery activation time.

Funnel Refinement Note

An intermediate “Start Core Action” step (mapped to add_to_cart) was initially considered. However, exploratory analysis showed that most activated users progressed directly from feature discovery (view_item) to activation (purchase), with minimal interaction at the intermediate step. Including this step introduced systematic NULLs and did not contribute meaningful behavioral separation. To avoid artificial funnel complexity and reflect observed user journeys, the funnel was intentionally simplified.

Median Time Between Funnel Steps (seconds)
Activation Segment	App Open → Onboarding	Onboarding → Feature Discovery	Feature Discovery → Activation
Fast Activator	36.5	62.6	177.1
Slow Activator	63.3	95.4	909.9
Key Insight

Activation delays are not evenly distributed across the funnel. While early steps show only minor differences between Fast and Slow activators, the time from feature discovery to activation is nearly 5× longer for Slow activators. This indicates that activation friction is driven primarily by hesitation after value exposure, rather than onboarding or navigation issues.

Implication

Product experiments aimed at improving activation should focus on the post-discovery experience — such as reinforcing value, clarifying next steps, or reducing perceived commitment — rather than optimizing early onboarding flows.


## Note: delete later

Funnel Refinement Note

An intermediate “Start Core Action” step (mapped to add_to_cart) was initially included to represent the transition from intent to execution. However, exploratory analysis revealed that for the activated cohort, this event was rarely observed and frequently bypassed entirely, with users moving directly from feature discovery (view_item) to activation (purchase).

As a result, the intermediate step failed to provide meaningful behavioral separation. Its inclusion introduced systematic NULLs, added no explanatory power to activation pacing, and risked creating an artificial bottleneck not supported by actual user behavior.

To preserve analytical integrity and ensure the funnel reflected observed user journeys rather than assumed ones, the step was intentionally removed. The refined funnel therefore focuses on the transitions that meaningfully influenced activation timing and decision-making.
