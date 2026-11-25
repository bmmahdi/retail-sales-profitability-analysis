# Process Maps — Retail Sales Performance & Profitability Analysis

## AS-IS Process (current state)

```mermaid
flowchart TD
    subgraph Sales["Sales Team"]
        S1[Receive order] --> S2[Apply discount ad hoc]
        S2 --> S3[Send order to Ops]
    end
    subgraph Ops["Operations"]
        S3 --> O1[Choose ship mode by habit]
        O1 --> O2[Ship order]
        O2 --> O3[Record shipping cost]
    end
    subgraph Finance["Finance"]
        O3 --> F1[Monthly manual report in Excel]
        F1 --> F2[Review margin after the fact]
    end
    subgraph Mgmt["Management"]
        F2 --> M1[Quarterly review]
        M1 --> M2[No structured discount or ship policy]
    end
```

## TO-BE Process (target state)

```mermaid
flowchart TD
    subgraph Sales["Sales Team"]
        T1[Receive order] --> T2{Discount within cap?}
        T2 -- Yes --> T3[Confirm order]
        T2 -- No --> T4[Escalate to Category Manager]
        T4 --> T3
    end
    subgraph Ops["Operations"]
        T3 --> O5{Ship mode policy}
        O5 -- Priority High --> O6[Regular Air]
        O5 -- Standard --> O7[Delivery Truck]
        O6 --> O8[Ship order]
        O7 --> O8
        O8 --> O9[Auto-log shipping cost]
    end
    subgraph BI["BI / Analytics"]
        O9 --> B1[Automated dashboard refresh]
        B1 --> B2[Daily KPI monitoring]
        B2 --> B3[Alert on margin below threshold]
    end
    subgraph Mgmt["Management"]
        B3 --> M3[Monthly review with data]
        M3 --> M4[Adjust discount caps and ship policy]
    end
```

## Gap Analysis

| # | Gap | AS-IS | TO-BE | Action |
|---|---|---|---|---|
| 1 | Discount governance | Ad hoc discounts | Discount cap per category | Define caps from discount analysis |
| 2 | Ship-mode selection | Habit-based | Policy by order priority | Publish ship-mode matrix |
| 3 | Reporting cadence | Monthly manual Excel | Daily automated dashboard | Deploy dashboard |
| 4 | Margin monitoring | After the fact | Real-time alerts | Set margin threshold alerts |
| 5 | Loss-making SKUs | Not tracked | Flagged in dashboard | Quarterly SKU review |
| 6 | Stakeholder alignment | Quarterly only | Monthly data review | Add monthly review to calendar |
