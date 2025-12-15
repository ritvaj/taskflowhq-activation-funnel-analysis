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

---

# taskflowhq-onboarding-activation-funnel-analysis

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



## Retention Metrics

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

