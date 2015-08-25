# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: 'Joey',password: 'test',email: 'Joey@test.com',phone: '123-456-7890',firstname: 'Joey',lastname: 'Jones')
User.create(username: 'Kev',password: 'test',email: 'Kev@test.com',phone: '800-209-0002',firstname: 'Kev',lastname: 'Smith')



User.find(1).cards.create(number: '37970283042380', credit_limit: 1450, exp_date: '2019-01-01', cvv: 1234)  
User.find(1).cards.create(number: '37970283042380', credit_limit: 3400, exp_date: '2019-01-01', cvv: 1234) 
User.find(1).cards.create(number: '4280283042380',  credit_limit: 1600, exp_date: '2022-01-01', cvv: 8879) 
User.find(2).cards.create(number: '379724978247978', credit_limit: 900, exp_date: '2019-01-10', cvv: 1234) 

User.find(1).accounts.create(number: '1234567890987654', acctype: 'Cheque', balance: 76.54) 
User.find(1).accounts.create(number: '98765434567897654', acctype: 'Savings', balance: 18096.21)
User.find(1).accounts.create(number: '1234567890', acctype: 'Cheque', balance: 98760.08)
User.find(1).accounts.create(number: '7563127576575', acctype: 'Savings', balance: 55.67)
User.find(2).accounts.create(number: '123456789876', acctype: 'Cheque', balance: 98.09)
User.find(2).accounts.create(number: '345678987654', acctype: 'Savings', balance: 212.34)
User.find(2).accounts.create(number: '7687263426878', acctype: 'CD', balance: 1451.99)
User.find(1).accounts.create(number: '2987349728347897', acctype: 'CD', balance: 16098)

Card.find(1).transactions.create(description: 'cheese', amount: 4.38, currency: 'USD', transaction_type: 'withdrawal', transaction_status: 'posted', transaction_date: '2015-04-07 00:00:00', post_date: '2015-04-07 00:00:00', merchant: 'Jubilee', associated_entity: 'card', card_id: 1)

Card.find(1).transactions.create(description: 'grout', amount: 15.98, currency: 'USD', transaction_type: 'withdrawal', transaction_status: 'posted', transaction_date: '2015-04-07 00:00:00', post_date: '2015-04-07 00:00:00', merchant: 'Ace Hardware',  associated_entity: 'card', card_id: 1)
Card.find(1).transactions.create(description: 'clothing', amount: 149.95, currency: 'USD', transaction_type: 'withdrawal', transaction_status: 'posted', transaction_date: '2015-01-07 00:00:00', post_date: '2015-01-07 00:00:00', merchant: 'Macy\'s', associated_entity: 'card', card_id: 3)
Card.find(2).transactions.create(description: 'car payment - recurring', amount: 1200, currency: 'USD', transaction_type: 'withdrawal', transaction_status: 'posted', transaction_date: '2015-02-07 00:00:00', post_date: '2015-02-07 00:00:00', merchant: 'Hyundai Manhattan', account_id: 1, associated_entity: 'account')
Card.find(2).transactions.create(description: 'car mats', amount: 145.08, currency: 'USD', transaction_type: 'withdrawal', transaction_status: 'posted', transaction_date: '2015-02-07 00:00:00', post_date: '2015-02-07 00:00:00', merchant: 'Home Depot', account_id: 1, associated_entity: 'account')
Account.find(1).transactions.create(description: 'car polish', amount: 35.65, currency: 'USD', transaction_type: 'withdrawal', transaction_status: 'posted', transaction_date: '2015-02-07 00:00:00', post_date: '2015-02-07 00:00:00', merchant: 'Home Depot', account_id: 2, associated_entity: 'account')
Account.find(2).transactions.create(description: 'cheeseburger', amount: 10.99, currency: 'USD', transaction_type: 'withdrawal', transaction_status: 'posted', transaction_date: '2015-07-2015 00:00:00', post_date: '2015-07-2015 00:00:00', merchant: 'Smashburger', account_id: 2, associated_entity: 'account')

