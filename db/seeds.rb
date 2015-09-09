Account.create!([
  {number: "123456789876", acctype: "Cheque", balance: "980.09"},
  {number: "7563127576575", acctype: "Savings", balance: "5500.67"},
  {number: "345678987654", acctype: "Savings", balance: "2120.34"},
  {number: "7687263426878", acctype: "CD", balance: "145180.99"},
  {number: "2987349728347897", acctype: "CD", balance: "16098.0"}
])
Card.create!([
  {number: "37970283042380", category: "American Express", credit_limit: "3400.0", exp_date: "2019-01-01", cvv: 1234},
  {number: "4280283042380", category: "VISA", credit_limit: "1600.0", exp_date: "2022-01-01", cvv: 8879},
  {number: "379724978247978", category: "American Express", credit_limit: "9000.0", exp_date: "2019-01-10", cvv: 7434},
  {number: "379734567865422", category: "American Express", credit_limit: "19000.0", exp_date: "2019-07-10", cvv: 1200}
])
Transaction.create!([
  {description: "grout", amount: "15.98", currency: "USD", transaction_type: "2", transaction_status: "posted", transaction_date: "2015-04-07 00:00:00", post_date: "2015-04-07 00:00:00", merchant: "Ace Hardware", account_id: nil, associated_entity: "card", card_id: 1},
  {description: "car payment - recurring", amount: "1200.0", currency: "USD", transaction_type: "withdrawal", transaction_status: "posted", transaction_date: "2015-02-07 00:00:00", post_date: "2015-02-07 00:00:00", merchant: "Hyundai Manhattan", account_id: 1, associated_entity: "account", card_id: nil},
  {description: "Tiles", amount: "1400.95", currency: "USD", transaction_type: "2", transaction_status: "", transaction_date: "2015-09-09 00:00:00", post_date: "2015-09-09 00:00:00", merchant: "Tile World", account_id: nil, associated_entity: "card", card_id: 1},
  {description: "Bathtub", amount: "911.99", currency: "USD", transaction_type: "2", transaction_status: "", transaction_date: "2015-09-08 00:00:00", post_date: "2015-09-09 00:00:00", merchant: "Salvage Warehouse", account_id: nil, associated_entity: "card", card_id: 1},
  {description: "African Wall Flower Stencil", amount: "199.9", currency: "USD", transaction_type: "2", transaction_status: "", transaction_date: "2015-09-01 00:00:00", post_date: "2015-09-01 00:00:00", merchant: "Royal Design Studio", account_id: nil, associated_entity: "card", card_id: 1},
  {description: "Pizza", amount: "91.0", currency: "USD", transaction_type: "2", transaction_status: "Dispute process started", transaction_date: "2015-09-09 00:00:00", post_date: nil, merchant: "Claudio Pizzeria Ristorante", account_id: nil, associated_entity: "card", card_id: 1},
  {description: "Pizza", amount: "45.19", currency: "USD", transaction_type: "2", transaction_status: "", transaction_date: "2015-09-09 00:00:00", post_date: nil, merchant: "Claudio Pizzeria Ristorante", account_id: nil, associated_entity: "card", card_id: 1},
  {description: "Salary", amount: "9700.0", currency: "USD", transaction_type: "2", transaction_status: "", transaction_date: "2015-09-01 00:00:00", post_date: "2015-09-01 00:00:00", merchant: "ACME", account_id: 1, associated_entity: "account", card_id: nil},
  {description: "Rent from Shingara Sands property", amount: "9000.0", currency: "ZAR", transaction_type: "2", transaction_status: "", transaction_date: "2015-09-01 00:00:00", post_date: "2015-09-01 00:00:00", merchant: "Tenant", account_id: 1, associated_entity: "account", card_id: nil}
])
User.create!([
  {username: "pbunsee", email: "pbunsee@gmail.com", phone: "908-731-1354", firstname: "Pranesha", lastname: "Bunsee", password_salt: "$2a$10$V95J6mR3PjXqn3RLHXnOGO", password_hash: "$2a$10$V95J6mR3PjXqn3RLHXnOGOpL4pp7kpDwllpBBPcLRuD.B5n6piH6e"},
  {username: "Joey", email: "Joey@test.com", phone: "123-456-7890", firstname: "Joey", lastname: "Jones", password_salt: "$2a$10$XYBFaOlHfTJQTlvanADU6O", password_hash: "$2a$10$XYBFaOlHfTJQTlvanADU6O5OT.gh6nbgJExB6sd5tk896BZLel49y"},
  {username: "Kev", email: "Kev@test.com", phone: "800-209-0002", firstname: "Kev", lastname: "Smith", password_salt: "$2a$10$JyQ.DkZ72zew13bvBoPWRO", password_hash: "$2a$10$JyQ.DkZ72zew13bvBoPWROmBOLw5GitXk9ZGkQHliaCRZ1Q/t79wm"}
])
UserAccount.create!([
  {user_id: 1, account_id: 1},
  {user_id: 1, account_id: 2},
  {user_id: 1, account_id: 3},
  {user_id: 1, account_id: 4},
  {user_id: 1, account_id: 5}
])
UserCard.create!([
  {user_id: 1, card_id: 1},
  {user_id: 1, card_id: 2},
  {user_id: 1, card_id: 3},
  {user_id: 1, card_id: 4}
])
