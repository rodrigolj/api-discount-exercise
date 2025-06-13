# Exercise: Promotional Shopping Cart

## Functional Requirements

1. Add and Remove Items
   [ ] The system should provide an interface to add products to the cart and
   remove products from the cart.
2. User Type
   [x] The system should support two user types: Common and VIP.
   [ ] A VIP user has access to the VIP discount the “Get 3 for 2” promotion,
   whichever is more advantageous.
   or
3. Promotional Logic
   [ ] Get 3 for the Price of 2
   • Buy 3 items, pay only for the 2 most expensive ones (the cheapest is
   free).
   • Extends to multiple items (e.g., buy 6, pay for 4, etc.).
   [ ] VIP Discount (15%)
   • Applies to all items in the cart.
   • Cannot be combined with “Get 3 for 2” if the user is VIP.
4. Automatic Best Price Calculation
   [ ] If the user is VIP, the system should calculate promotions and
   automatically recommend the cheaper total.
   both
   [ ] If the user is Common, only “Get 3 for 2” applies.
5. Pricing Table
   [ ] The base product catalog (price in USD) is as follows:
   Product Price
   T-shirt 35.99
   Jeans 65.50
   Dress 80.75

   You may assume these are the only valid products for now, or feel free
   to extend as needed.
