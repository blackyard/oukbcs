# Customer Loyalty Advisor

A Jac-based application that analyzes customer behavior and provides personalized loyalty recommendations using LLM-powered insights.

## Overview

The Customer Loyalty Advisor app is built following the same architecture pattern as the guess_game6 implementation. It uses walkers, nodes, and LLM integration to analyze customer data and generate intelligent recommendations.

## Features

- **Customer Tier Classification**: Automatically classifies customers into Bronze, Silver, or Gold tiers based on purchase history
  - Bronze: 0-9 purchases
  - Silver: 10-29 purchases
  - Gold: 30+ purchases

- **LLM-Powered Analysis**: Uses Google's Gemini 2.0 Flash model to provide:
  - Personalized loyalty advice based on customer behavior
  - Tailored reward suggestions for each tier
  - Strategic recommendations to improve customer retention

- **Customer Metrics Tracking**:
  - Total number of purchases
  - Average spending per transaction
  - Days since last visit
  - Current loyalty tier

## Files

- **loyalty_advisor.jac**: Main application file containing walker and node definitions
- **loyalty_advisor.impl.jac**: Implementation logic for customer analysis and tier classification

## Usage

Run the application with:

```bash
jac run loyalty_advisor.jac
```

The app includes three sample customers demonstrating different loyalty tiers:
- Alice Johnson (Silver tier)
- Bob Smith (Bronze tier)
- Carol Williams (Gold tier)

## Customization

You can analyze different customers by modifying the main entry point:

```jac
with entry:__main__ {
    root spawn LoyaltyAdvisor("Customer Name", purchases, avg_spend, last_visit_days);
}
```

## Architecture

The app follows the walker-node pattern:

1. **LoyaltyAdvisor Walker**: Carries customer data and traverses the graph
2. **customer_profile Node**: Stores loyalty tier information and thresholds
3. **LLM Functions**: 
   - `give_loyalty_advice()`: Generates personalized advice
   - `suggest_rewards()`: Recommends appropriate rewards

## Requirements

- Jac programming language
- byllm library for LLM integration
- API access to Google Gemini (or alternative LLM model)
- Environment variables configured (if needed for API keys)

## Example Output

```
============================================================
CUSTOMER LOYALTY ANALYSIS
============================================================
Customer: Alice Johnson
Total Purchases: 15
Average Spend: $75.5
Days Since Last Visit: 5
Current Tier: Silver
------------------------------------------------------------

PERSONALIZED ADVICE:
[AI-generated personalized recommendations...]

RECOMMENDED REWARDS:
[AI-generated reward suggestions...]
============================================================
```

## Next Steps

Potential enhancements:
- Add database integration for real customer data
- Create a web interface using Streamlit (similar to app.jac)
- Implement email notification system for personalized offers
- Add analytics dashboard for business insights
- Create batch processing for large customer databases
