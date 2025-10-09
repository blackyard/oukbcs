"""Customer Loyalty Advisor - Analyzes customer behavior and provides loyalty recommendations"""

import from byllm.llm { Model }

# Configure LLM model
glob llm = Model(model_name="gemini/gemini-2.0-flash", verbose=False);

"""Provide personalized loyalty advice based on customer metrics in Kenya Shillings (KES)"""
def give_loyalty_advice(customer_name: str, purchases: int, avg_spend: float, last_visit_days: int) -> str by llm();

"""Suggest rewards and incentives to improve loyalty in Kenya Shillings (KES)"""
def suggest_rewards(loyalty_tier: str, customer_history: str) -> str by llm();

walker LoyaltyAdvisor {
    has customer_name: str;
    has purchases: int;
    has avg_spend: float;
    has last_visit_days: int;

    can start with `root entry;
    can analyze_loyalty with customer_profile entry;
}

node customer_profile {
    has loyalty_tier: str;
    has tier_threshold: dict;
}

# Will run when in CLI mode (not in cloud)
with entry:__main__ {
    # Example customer data
    root spawn LoyaltyAdvisor("Alice Kamau", 15, 75.00, 5);
    root spawn LoyaltyAdvisor("Bob Kioko", 3, 25.00, 45);
    root spawn LoyaltyAdvisor("Carol Wamalwa", 50, 150.00, 2);
}
