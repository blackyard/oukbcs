impl LoyaltyAdvisor.start {
    if not [root --> (`?customer_profile)] {
        # Initialize tier thresholds: Bronze (0-9 purchases), Silver (10-29), Gold (30+)
        tier_thresholds = {
            'Bronze': 0,
            'Silver': 10,
            'Gold': 30
        };
        next = root ++> customer_profile('Bronze', tier_thresholds);
    } else {
        next = [root --> (`?customer_profile)];
    }
    visit next;
}

impl LoyaltyAdvisor.analyze_loyalty {
    if [-->] {
        visit [-->];
    } else {
        # Determine loyalty tier based on purchase count
        current_tier = 'Bronze';
        if self.purchases >= 30 {
            current_tier = 'Gold';
        } elif self.purchases >= 10 {
            current_tier = 'Silver';
        }
        
        # Display customer information
        print(f"{'='*60}");
        print(f"CUSTOMER LOYALTY ANALYSIS");
        print(f"{'='*60}");
        print(f"Customer: {self.customer_name}");
        print(f"Total Purchases: {self.purchases}");
        print(f"Average Spend: KES {round(self.avg_spend, 2)}");
        print(f"Days Since Last Visit: {self.last_visit_days}");
        print(f"Current Tier: {current_tier}");
        print(f"{'-'*60}");
        
        # Get personalized loyalty advice from LLM
        advice = give_loyalty_advice(
            self.customer_name, 
            self.purchases, 
            self.avg_spend, 
            self.last_visit_days
        );
        print(f"PERSONALIZED ADVICE:");
        print(advice);
        
        # Get reward suggestions
        customer_history = f"Purchases: {self.purchases}, Avg Spend: KES {round(self.avg_spend, 2)}, Last Visit: {self.last_visit_days} days ago";
        rewards = suggest_rewards(current_tier, customer_history);
        print(f"RECOMMENDED REWARDS:");
        print(rewards);
        print(f"{'='*60}");
        
        # Create a new profile node with updated tier
        here ++> customer_profile(current_tier, here.tier_threshold);
        disengage;
    }
}
