# Example Smart Contract

This is an example smart contract written in Solidity. The contract provides functionality for managing a counter with the ability to increment, decrement, and retrieve the current value of the counter, along with a description of the counter.

## Overview

The contract allows only the owner of the contract to modify the counter's value (increment or decrement). It also provides query functions to get the current value of the counter and its description. The counter's value and description are initialized when the contract is deployed.

## Features

- **Owner Control**: Only the owner of the contract can increment or decrement the counter.
- **Counter Struct**: The contract uses a `Counter` struct that holds the current number (uint) and a description (string).
- **Gas-Free Query Functions**: There are functions to retrieve the current counter value and its description without paying gas fees.
- **Security**: The contract uses the `onlyOwner` modifier to restrict access to specific functions.

## Functions

### `constructor(uint initial_value, string memory description)`

- **Description**: Initializes the contract with an initial counter value and a description. The contract creator is assigned as the owner.
- **Parameters**:
  - `initial_value`: The initial value of the counter (uint).
  - `description`: A string describing the counter.

### `increment_counter()`

- **Description**: Increases the counter by 1. Can only be called by the owner of the contract.
- **Modifier**: `onlyOwner`

### `decrement_counter()`

- **Description**: Decreases the counter by 1. Can only be called by the owner of the contract.
- **Modifier**: `onlyOwner`

### `get_counter_value()`

- **Description**: Retrieves the current value of the counter.
- **Returns**: The current value of the counter (uint).

### `get_description_name()`

- **Description**: Retrieves the description of the counter.
- **Returns**: The description of the counter (string).

## Security

The `onlyOwner` modifier ensures that only the contract's owner can call the functions that modify the counter. Unauthorized users will be blocked from modifying the counter with the `require` statement.

## Example Usage

1. **Deploy the Contract**: Provide an initial counter value and description when deploying the contract.
   
   Example deployment:
   ```solidity
   Example counterContract = new Example(0, "Initial Counter");

2. **Increment the Counter**: The owner can increment the counter.

counterContract.increment_counter();
3. **Decrement the Counter:** The owner can decrement the counter.

counterContract.decrement_counter();
4. **Get the Counter Value:** Anyone can query the current value of the counter.

uint currentValue = counterContract.get_counter_value();

5.**Get the Counter Description:** Anyone can query the description of the counter.

string memory description = counterContract.get_description_name();