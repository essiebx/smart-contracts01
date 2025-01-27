// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;


contract Example {


    address owner; //THIS IS THE OWNER OF THE CONTRACT

 // This is our counter struct. It will hold necessary information about the counter which are
    // number and description
    struct Counter { // THIS OUR CONTRUCTOR
        uint number;  //UINT MEANS THE COUNTER CAN START FROM ZERO AND ABOVE BUT NOT -VE
        string description; //THIS DESCRIBES THE COUNTER 
    }

 // Here we create an instance of our Counter.
    // It is empty for now, but we will initialize it in the constructor.
    Counter counter;


    modifier onlyOwner() { //modifier are special type of function that you use to modify the behavior of other functions eg conditions
        require(msg.sender == owner,  "Only the owner can increment or decrement the counter");
// sender == owner,  is the condition
        _;  //a special symbol that is used in Solidity modifiers to indicate the end of the modifier and
        //  the beginning of the function that the modifier is modifying.
    }
 // This is our constructor function. It only runs once when we deploy the contract.
    // Since it takes two parameters, initial_value and description, they should be provided
    // when we deploy our contract.
    constructor(uint initial_value, string memory description) {
        owner = msg.sender;
        counter = Counter(initial_value, description);
    }
// end of the data part of the contract



// Below, we have two execute functions, increment_counter and decrement_counter
    // Since they modify data on chain, they require gas fee.
    // They are external functions, meaning they can only be called outside of the contract.
    // They also have the onlyOwner modifier which we created above. This make sure that
    // only the owner of this contract can call these functions.
    // This function gets the number field from the counter struct and increases it by one.
    function increment_counter() external onlyOwner {
        counter.number += 1;
    }

// This function is similar the one above,
//  but instead of increasing we deacrease the number by one.
    function decrement_counter() external onlyOwner {
        counter.number -= 1;
    }
// end of the execution part of the contract



// The function below is a query function.
    // It does not change any data on the chain. It just rerieves data.
    // We use the keyword view to indicate it retrieves data but does not change any.
    // Since we are not modifying any data, we do not pay any gas fee.
    // This function returns the number field of our counter struct.
    // Returning the current state of our counter.
    function get_counter_value() external view returns(uint) {
        // the view means we nare retrieving data from the blochkchain but not editing it 
        return counter.number;
    }

    // TASK1
    // create a function that will return description rather than the counter
    function  get_description_name() external  view  returns(string memory) {
        // the returned string should be stored in a temporary location called "memory",
        //  which is suitable for returning data from function calls.
        return counter.description;
    }

    // end of the query partv of the contract
}