# Savings Protocol with High APY

## Description
The Savings Protocol is a decentralized financial platform built on the Aptos blockchain, offering users the opportunity to earn a high Annual Percentage Yield (APY) on their savings. The protocol enables users to deposit funds and earn rewards through a transparent, secure, and efficient smart contract.

## Vision
The primary vision of the Savings Protocol is to democratize financial growth opportunities by providing users with a secure and high-yield savings platform. By leveraging blockchain technology, the protocol ensures fairness, transparency, and accessibility for all users.

## Future Scope
- **Dynamic APY Calculation:** Implementing an adaptive APY mechanism based on market demand and supply.
- **Multi-Token Support:** Expanding the protocol to support various stablecoins and digital assets.
- **Governance Model:** Introducing a decentralized governance system for protocol management.
- **Audit and Security Enhancements:** Collaborating with third-party auditors for enhanced contract security.
- **User Dashboard:** Building an intuitive user interface for tracking savings and rewards.

## Contract Details
The project consists of two primary functions:

1. **Create Savings Pool**
    - Allows users to create a savings pool by specifying initial parameters such as the pool goal.
    - The pool owner can manage and monitor deposits.

2. **Deposit Funds**
    - Users can deposit funds into the savings pool using AptosCoin (APT).
    - Deposited funds contribute to the overall pool and begin generating rewards.

### Key Modules and Dependencies
- **Aptos Framework**: Provides essential blockchain functionality.
- **Signer**: Authenticates transactions securely.
- **AptosCoin**: Native currency used for deposits and rewards.

### Example
```move
module SavingsProtocol::HighAPY {

    use aptos_framework::signer;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;

    struct SavingsPool has store, key {
        total_deposits: u64,
        goal: u64,
    }

    public fun create_pool(owner: &signer, goal: u64) {
        let pool = SavingsPool {
            total_deposits: 0,
            goal,
        };
        move_to(owner, pool);
    }

    public fun deposit_funds(user: &signer, pool_owner: address, amount: u64) acquires SavingsPool {
        let pool = borrow_global_mut<SavingsPool>(pool_owner);
        let deposit = coin::withdraw<AptosCoin>(user, amount);
        coin::deposit<AptosCoin>(pool_owner, deposit);
        pool.total_deposits = pool.total_deposits + amount;
    }
}
```

## Conclusion
The Savings Protocol is designed to empower users by providing secure and high-yield savings options on the Aptos blockchain. Future developments will continue to enhance the platform, ensuring a sustainable and rewarding experience for all participants.

contract address
"0x63fd1ddf6ce5b96823d75bba1704d8e19bfe1090d61f13b0f820d09db9296c41"

![Screenshot 2025-03-26 110339](https://github.com/user-attachments/assets/b841de10-3023-4640-88b0-b2d0fa65abb3)


