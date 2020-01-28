# Bank tech test

Makers week 10 practice tech test. This is a mock "Take Home" tech test, with essentially unlimited time. The aim is to use the test to OO design and TDD skills.

## Specification

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

## User Stories

From the specification, I have generated the following user stories. 

```
As a bank customer
So that I can securely store my money
I want to be able to *deposit* my money into a *bank account*
```
```
As a bank customer
So that I can spend my money
I want to be able to *withdraw* my money from my *bank account*
```
```
As a bank customer
So that I can see what I have spent on my account
I want to be able to *view* an *account statement*
```
```
As a bank customer
So that I can see my most recent purchases first
I want to be able to see my *transactions* in *reverse chronological* order
```
```
As a bank manager
So that my customers cannot withdraw more money than agreed
I want to be able to *reject* transactions that breach the *minimum limit*
```

## Design Approach

The program is split into 4 classes described below, each indedendently unit tested.  

**BankAccount** This manages user transactions  
**transaction** This stores information pertaining to the transaction: Date / Credit or Debit / balance after transaction  
**transaction_history** This stores all previous transactions  
**print_statement** This formats the transactions for printing to stdout  

## Domain Model

Instance variables and methods attributed to each class

| **BANK_ACCOUNT**     | **TRANSACTION**      | **TRANSACTION_HISTORY** | **PRINT_STATEMENT**
| ---------------      | -------------------  | ---------------         | ---------------
| **Instance Variables** |
| @balance             | @amount              | @transactions           | @transaction_history |
| @transactions        | @date                |                         | |
|                      | @type                |                         | |
|                      | @balance             |                         | |
| **Methods** |
| #deposit             | #amount              | #add                    | #print_header |
| #withdraw            | #date                |                         | #print_transactions |
| #statement           | #type                |                         | |
| #balance             | #balance             |                         | |


## Technologies Used

### Development Code

* ```Ruby```

### Testing

* ```rspec```

### Code Quality

* ```rubocop 0.71.0``` (linting)
* ```simplecov``` (test coverage)