<h1 align="center">Welcome to Coin Machine API 👋</h1>
<p>
  <img alt="Version" src="https://img.shields.io/badge/version-0.1.0-blue.svg?cacheSeconds=2592000" />
  <a href="https://twitter.com/suretrustng" target="_blank">
    <img alt="Twitter: suretrustng" src="https://img.shields.io/twitter/follow/suretrustng.svg?style=social" />
  </a>
</p>

    This is a RESTful Rails API that acts as a Coin Machine, it allows coin deposits and withdrawals. It acts exclusively with JSON format for the endpoints. This API does not require Users or typical authentication, with devise or otherwise, instead Api Keys are used to track all actions.

## Usage

Live on heroku [here](http://coins-machine-api.herokuapp.com)

### API User

- You can create a new API user by using your email. The api_key is automatically generated and displayed.

```
POST http://coins-machine-api.herokuapp.com/api/v1/api_users?api_user[email]=YOUR_EMAIL
```

- The api_key must be added as a parameter before you can make any request from this API. If you already have an account, to get your API_KEY:

```
GET http://coins-machine-api.herokuapp.com/api/v1/api_users?api_user[email]=YOUR_EMAIL
```

### Coins

A valid API user can:

- create a new Coin. The coin has 2 attributes -> `value` and `name`. However, you only need to add the coin name as the default value of any created coin is `0`.

- `COIN_NAME` here is the name of the coin you want to create.

```
POST http://coins-machine-api.herokuapp.com/api/v1/coins?api_key=YOUR_ACCESS_TOKEN&coin[name]=COIN_NAME
```

- update a coin's name. Coin names must be unique.

- `COIN_NAME` here is the new intended name for the coin you want to update.

```
PATCH http://coins-machine-api.herokuapp.com/api/v1/coins/COIN_ID?api_key=YOUR_ACCESS_TOKEN&coin[name]=COIN_NAME

PUT http://coins-machine-api.herokuapp.com/api/v1/coins/COIN_ID?api_key=YOUR_ACCESS_TOKEN&coin[name]=COIN_NAME
```

- delete a coin using the ID.

```
DELETE http://coins-machine-api.herokuapp.com/api/v1/coins/COIN_ID/?api_key=YOUR_ACCESS_TOKEN
```

- view all coins.

```
GET http://coins-machine-api.herokuapp.com/api/v1/coins?api_key=YOUR_ACCESS_TOKEN
```

- view the details of a coin using the ID.

```
GET http://coins-machine-api.herokuapp.com/api/v1/coins/COIN_ID/?api_key=YOUR_ACCESS_TOKEN
```

- get the total value of all coins in the system.

```
GET http://coins-machine-api.herokuapp.com/api/v1/coins_total_value?api_key=YOUR_ACCESS_TOKEN
```

## Transactions

A valid API user can:

- create a transaction using the :coin_id, and :transaction_type. The transaction type can only be `deposit` or `withdraw`.

### Deposit

Each deposit increases the coin's value by `1`.

```
POST http://coins-machine-api.herokuapp.com/api/v1/transactions?api_key=YOUR_ACCESS_TOKEN&transaction[coin_id]=COIN_ID&transaction[transaction_type]=deposit
```

### Withdraw

Each withdrawal decreases the coin's value by `1`. Once the coin value is less than `1`, you can no longer withdraw since there's nothing to withdraw.

```
POST http://coins-machine-api.herokuapp.com/api/v1/transactions?api_key=YOUR_ACCESS_TOKEN&transaction[coin_id]=COIN_ID&transaction[transaction_type]=withdraw
```

- view a list of all transactions.

```
GET http://coins-machine-api.herokuapp.com/api/v1/transactions?api_key=YOUR_ACCESS_TOKEN
```

- view all transactions scoped to a specific user using the user's email.

```
GET http://coins-machine-api.herokuapp.com/api/v1/api_user_transactions?api_key=YOUR_ACCESS_TOKEN&email=USER_EMAIL
```

## Alerting

Since we don't want our Coin Machines to run low very often we will need to fill them up; in order to do this we will need to know when they are running low. The system alerts all Admins when the count of certain coin is low (< 4 in the system after a Transaction).

The email contains:

- the kind of Coin.
- the coin value.
- and the current value of all Coins in the system.

The email is sent asynchronously.

### Admins

- To become an admin and receive low coin value notifications, you must create an administrator account.

```
POST http://coins-machine-api.herokuapp.com/api/v1/admins?admin[email]=ADMIN_EMAIL
```

- You can get the email of all admins.

```
GET http://coins-machine-api.herokuapp.com/api/v1/admins
```

## Run tests

```sh
rspec
```

## Author

👤 **Saheed Oladele**

- Website: [Saheed Oladele](https://saheedoladele.com)
- Twitter: [@suretrustng](https://twitter.com/suretrustng)
- Github: [@suretrust](https://github.com/suretrust)
- LinkedIn: [@saheed-oladele](https://linkedin.com/in/saheed-oladele)
- E-mail: [(Email)](mailto:saholadele@gmail.com)
