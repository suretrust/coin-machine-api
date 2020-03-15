# Welcome to Coin Machine API

This is a RESTful Rails API that acts as a Coin Machine, it allows coin deposits and withdrawals.

## Usage

### API User

- You can create a new API user by using your email. The access token is automatically generated and displayed.

```
POST /api/v1/api_users?api_user[email]=YOUR_EMAIL
```

- The access token must be added as a parameter before you can make any request from this API.

### Coins

A valid API user can:

- create a new Coin. The coin has 2 attributes -> `value` and `name`. However, you only need to add the coin name as the default value of any created coin is `0`.

- `COIN_NAME` here is the name of the coin you want to create.

```
POST /api/v1/coins?api_key=YOUR_ACCESS_TOKEN&coin[name]=COIN_NAME
```

- update a coin's name. Coin names must be unique.

- `COIN_NAME` here is the new intended name for the coin you want to update.

```
PATCH /api/v1/coins/COIN_ID?api_key=YOUR_ACCESS_TOKEN&coin[name]=COIN_NAME
PUT /api/v1/coins/COIN_ID?api_key=YOUR_ACCESS_TOKEN&coin[name]=COIN_NAME
```

- delete a coin using the ID.

```
DELETE /api/v1/coins/COIN_ID/?api_key=YOUR_ACCESS_TOKEN
```

- view all coins.

```
GET /api/v1/coins?api_key=YOUR_ACCESS_TOKEN
```

- view the details of a coin using the ID.

```
GET /api/v1/coins/COIN_ID/?api_key=YOUR_ACCESS_TOKEN
```

- get the total value of all coins in the system.

```
GET /api/v1/coins_total_value?api_key=YOUR_ACCESS_TOKEN
```

## Transactions

A valid API user can:

- create a transaction using the :coin_id, and :transaction_type. The transaction type can only be `deposit` or `withdraw`.

### Deposit

Each deposit increases the coin's value by `1`.

```
POST /api/v1/transactions?api_key=YOUR_ACCESS_TOKEN&transaction[coin_id]=COIN_ID&transaction[transaction_type]=deposit
```

### Withdraw

Each withdrawal decreases the coin's value by `1`. Once the coin value is less than `1`, you can no longer withdraw since there's nothing to withdraw.

```
POST /api/v1/transactions?api_key=YOUR_ACCESS_TOKEN&transaction[coin_id]=COIN_ID&transaction[transaction_type]=withdraw
```

- view a list of all transactions.

```
GET /api/v1/transactions?api_key=YOUR_ACCESS_TOKEN
```

- view all transactions scoped to a specific user using the user's email.

```
GET /api/v1/api_user_transactions?api_key=YOUR_ACCESS_TOKEN&email=USER_EMAIL
```

## Alerting

Step 4: Alerting!
Since we don't want our Coin Machines to run low very often we will need to fill them up; in order to do this we will need to know when they are running low. Please set up a system for alerting all Admins when the count of certain coin is low (> 4 in the system after a Transaction). Please keep the following in mind when sending alerts:

Please send a single consistent email to all Admin emails, create an Admin resource to track this (single email means one email with all Admins on it, not an individual email to each Admin)
The email should contain the kind of Coin, the count, and the current value of all Coins in the system
Bonus Points if you send the email asynchronously

The URL of the deployed site
The URL of the GitHub Repo
Any additional notes you'd like to include
