// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;
 

contract BankingDApp {
    // Mapping to store balances of each user
    mapping(address => uint256) private balances;

    // Event for deposit
    event Deposit(address indexed user, uint256 amount);

    // Event for withdrawal
    event Withdrawal(address indexed user, uint256 amount);

    // Event for transfer
    event Transfer(address indexed from, address indexed to, uint256 amount);

    // Function to deposit Ether into the contract
    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than zero");
        balances[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }

    // Function to withdraw Ether from the contract
    function withdraw(uint256 amount) public {
        require(amount > 0, "Withdrawal amount must be greater than zero");
        require(balances[msg.sender] >= amount, "Insufficient balance");

        // Deduct the amount from the sender's balance
        balances[msg.sender] -= amount;

        // Transfer the Ether to the sender
        payable(msg.sender).transfer(amount);

        emit Withdrawal(msg.sender, amount);
    }

    // Function to check the balance of the sender
    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }

    // Function to transfer Ether to another user
    function transfer(address to, uint256 amount) public {
        require(amount > 0, "Transfer amount must be greater than zero");
        require(balances[msg.sender] >= amount, "Insufficient balance");
        require(to != address(0), "Cannot transfer to the zero address");

        // Deduct the amount from the sender's balance
        balances[msg.sender] -= amount;

        // Add the amount to the recipient's balance
        balances[to] += amount;

        emit Transfer(msg.sender, to, amount);
    }

    // Fallback function to handle Ether sent directly to the contract
    receive() external payable {
        deposit();
    }
}
