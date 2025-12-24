# TaskFlowHQ: Diagnosing Activation Funnel Drop-Off & Hesitation

## Overview

This project examines how new users move from initial exploration to meaningful usage in a B2B SaaS product, and where that journey breaks down.

TaskFlowHQ is a simulated B2B SaaS productivity tool designed to help individuals and teams plan, track, and complete work through structured tasks and workflows.

The analysis focuses on new-user onboarding and activation behavior using GA4 event data in BigQuery, with the goal of identifying why users fail to activate and translating those findings into testable product recommendations.

---

## Business Problem

This analysis is motivated by a common SaaS challenge: users enter the product but fail to convert early interest into sustained value.

Despite strong top-of-funnel entry, a large proportion of users fail to complete their first meaningful action, limiting:

- user retention  
- product adoption  
- long-term revenue potential  

Activation is critical because it represents the moment users transition from exploration to real value realization. Persistent failure to activate typically signals unclear value, perceived effort, or decision friction, rather than acquisition issues.

---

## Objectives

These objectives define the questions the analysis is designed to answer and ensure the work remains decision-focused rather than exploratory.

This project aims to:

- Quantify where activation drop-off occurs in the onboarding funnel  
- Identify whether friction is structural (onboarding or navigation) or behavioral (hesitation, uncertainty)  
- Measure time-based friction for users who do activate  
- Validate findings through segmentation and experimentation logic  
- Translate insights into practical, testable product recommendations  

---

## Analysis Workflow

The workflow below outlines how raw event data was progressively transformed into behavioral insights and product recommendations.

1. Ingested GA4 event-level data into BigQuery  
2. Constructed user-level funnel and activation tables  
3. Analyzed funnel conversion and time-to-next-step metrics  
4. Segmented activated users by activation speed  
5. Evaluated retention using onboarding cohorts  
6. Simulated an A/B testing framework to validate hypotheses  
7. Conducted root cause analysis and derived recommendations

---

## User Journey & Funnel Definition

This section clarifies how a new user experiences the product and where we draw the line for meaningful activation.

### User Journey

A typical new user flow looks like this:

1. Opens TaskFlowHQ  
2. Proceeds through onboarding or setup screens  
3. Explores at least one core feature  
4. Attempts to complete a task or workflow  
5. Successfully completes a first meaningful action (activation)

This sequence represents the minimum path required for a user to understand the product’s value.

### Activation Definition

Activation is defined as the point where a user shifts from passive exploration to intentional use.  
At this moment, the user demonstrates that TaskFlowHQ can be applied to a real task, not just browsed or tested superficially.

### Funnel Steps

This section translates the abstract user journey into concrete, measurable funnel steps used for analysis.

| Step | Description |
|---|---|
| App Open | User opens the app |
| Onboarding Screen Viewed | Initial setup or login screens |
| Feature Discovery | User explores a core feature |
| Activation | User completes first meaningful action |

**Funnel refinement note:**  
An intermediate “Start Core Action” step was initially considered but removed after exploratory analysis showed it added no behavioral signal and introduced systematic NULLs. The refined funnel reflects observed user behavior rather than assumed intent.

#### GA4 Event Mapping (Reference)

This table serves as a compact reference showing how raw GA4 events are translated into product-level funnel steps.

| GA4 Event | Product Interpretation |
|----------|------------------------|
| session_start | App Open |
| page_view (login / home) | Onboarding |
| view_item | Feature Discovery |
| purchase | Activation |

---

## Data & Tools

### Tools Used
- **BigQuery** (GA4 event-level exports)  
- **SQL** (funnel construction, retention cohorts, segmentation, experimentation)  
- **Python (Matplotlib)** for custom visualizations  

### Skills Applied
- Product analytics  
- Funnel and drop-off analysis  
- Time-to-event analysis  
- Retention cohort analysis  
- Segmentation (Fast vs Slow Activators)  
- A/B testing design and statistical evaluation  
- Root cause analysis (RCA)

---

## KPI Framework

This section defines the core metrics used to evaluate activation quality, user friction, and early retention.

### Activation & Funnel Metrics

- **Activation Rate:** 4.5%  
- **Feature Discovery Rate:** 33.3%  

**Key Conversion Rates:**
- App Open → Onboarding: 25.8%  
- Onboarding → Feature Discovery: 33.3%  
- Feature Discovery → Activation: 4.5%  

### Pacing & Friction

- Median time (Onboarding → Feature Discovery): **74s**  
- Median time (Feature Discovery → Activation): **727s (~12 min)**

The sharp increase in time after feature discovery signals hesitation rather than navigational friction.

### Retention (Onboarding Cohort)

- Day 1: **8.5%**  
- Day 3: **2.8%**  
- Day 7: **0.8%**

Retention drops steeply immediately after onboarding, indicating weak early habit formation and low short-term stickiness.

---

## Segmentation: Activation Speed

To understand whether friction is driven by usability issues or user hesitation, activated users were segmented by time-to-activation.

| Segment | Users | Share |
|---|---|---|
| Fast Activators | 4 | 44% |
| Slow Activators | 5 | 56% |

**Key Insight:**  
Slow Activators do not struggle with onboarding or navigation. Their friction emerges **after feature discovery**, indicating hesitation rather than inability.

The extended delay among users who eventually activate suggests that the same post-discovery friction is likely blocking many other users entirely, making this stage a high-leverage point for intervention.

---

## A/B Testing: Validating Post-Discovery Hesitation

An A/B test framework is used to evaluate whether reinforcing value post-discovery increases activation.

- **Hypothesis:** Reinforcing value post-discovery increases activation  
- **Null Hypothesis:** No difference between variants  
- **Metric:** Activation conversion  
- **Test:** Chi-square (χ² = 0.087, df = 1)

**Result:**  
The null hypothesis was not rejected. With only 9 total activations, the experiment is **underpowered** and results are **inconclusive**, not negative.

In this analysis, variants were assigned using a deterministic split (odd and even) to illustrate evaluation logic. In a production setting, users would be randomly assigned to a control experience and a modified post-discovery experience, with activation compared across the two variants over a fixed exposure window.

---

## Root Cause Analysis (RCA)

### Primary Finding

Activation friction is driven by **post-discovery hesitation**, not early funnel drop-off.

### What the Data Shows
- Users reach onboarding and feature discovery reliably  
- Activation often occurs, but **after long delays**  
- Fast and Slow Activators differ mainly in **decision speed**, not capability  

### What This Is NOT
- Not an onboarding usability problem  
- Not a navigation issue  
- Not a discoverability failure  

**Root Cause:**  
A **decision-confidence and value-clarity gap** immediately after feature discovery.

---

## Recommendations

### Priority 1: Reinforce Value Immediately After Discovery
- Explicitly communicate outcomes and benefits  
- Focus on value, not features  

### Priority 2: Reduce Perceived Commitment
- Signal low effort and reversibility  
- Reduce perceived risk at the activation moment  

### Priority 3: Clarify the Immediate Next Step
- Provide a single, explicit recommended action  
- Reduce ambiguity between discovery and execution  

All recommendations are **incremental, testable**, and aligned with the diagnosed root cause.

---

## Visuals

*Note: Funnel counts were visualized directly in BigQuery to reflect raw event-level aggregation, while pacing, retention, and experimentation visuals were created using Python for finer control.*
All generated figures are available in the [`visuals/`](visuals) directory.


### Funnel Overview — Drop-off Concentration
<img src="visuals/funnel_overview.png" width="800"><br><br>

**Insight:**  
Drop-off accelerates sharply after onboarding and feature discovery, with a steep contraction before activation. This shows that users are entering the product and exploring features but failing to convert exploration into committed usage, pointing to an activation clarity issue rather than an acquisition or onboarding failure.

---

### Median Time-to-Next-Step — Post-Discovery Hesitation
<img src="visuals/median_time_to_next_step.png" width="800"><br><br>

**Insight:**  
Users move quickly from onboarding to feature discovery, but the median time from discovery to activation is disproportionately long. This gap signals hesitation after initial exploration, suggesting uncertainty about next steps or insufficient confidence in the product’s immediate value.

---

### Onboarding Cohort Retention (D1 / D3 / D7) — Weak Early Habit Formation
<img src="visuals/onboarding_retention_d1_d3_d7.png" width="800"><br><br>

**Insight:**  
Retention declines sharply across Day 1, Day 3, and Day 7, with fewer than 1% of onboarded users returning by Day 7. This indicates that most users disengage before forming an early habit, reinforcing the need to accelerate value realization immediately after onboarding.

---

### A/B Activation Comparison — Correct Experiment Interpretation
<img src="visuals/ab_activation_horizontal_bar.png" width="800"><br><br>

**Insight:**  
Activation conversion differs only marginally between Variant A and Variant B and is not statistically significant. Given the absence of a real product intervention and limited sample size, this result is expected and demonstrates correct experimental interpretation rather than over-reading random variation.


### Synthesis

Taken together, the visuals show that the primary opportunity lies in reducing post-discovery hesitation and accelerating time-to-activation, rather than optimizing earlier funnel entry or downstream retention.


---

## Future Work / Next Steps

If this were a live product, next steps would include:

- Testing post-discovery value reinforcement via controlled experiments.  
- Measuring reductions in **time-to-activation**, not just conversion.  
- Extending retention analysis across rolling cohorts.  
- Instrumenting missing core-action events to close data gaps.  
- Increasing sample size and experiment exposure to enable statistically powered A/B testing.

---

## References

- Google Analytics 4 BigQuery Export Schema  
  https://support.google.com/analytics/answer/7029846

- Google BigQuery SQL Documentation  
  https://cloud.google.com/bigquery/docs/reference/standard-sql

---

## 👤 About Me

I’m **Ritvaj Madotra**, a data analyst passionate about using **Python, SQL, and business analytics** to design interpretable, impact-driven solutions.  
📌 Connect: [LinkedIn](https://www.linkedin.com/in/ritvajmadotra) | [GitHub](https://github.com/ritvaj)
