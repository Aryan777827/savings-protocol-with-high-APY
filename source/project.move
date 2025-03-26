module MyModule::SavingsProtocol {

    use aptos_framework::signer;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;

    struct SavingsAccount has store, key {
        balance: u64,
    }

    /// Function to create a savings account
    public fun create_account(owner: &signer) {
        let account = SavingsAccount { balance: 0 };
        move_to(owner, account);
    }

    /// Function to deposit funds and apply a high APY (e.g., 10%)
    public fun deposit_and_apply_apy(user: &signer, amount: u64) acquires SavingsAccount {
        let account = borrow_global_mut<SavingsAccount>(signer::address_of(user));
        let contribution = coin::withdraw<AptosCoin>(user, amount);
        coin::deposit<AptosCoin>(signer::address_of(user), contribution);

        // Apply 10% APY
        let interest = amount / 10;
        account.balance = account.balance + amount + interest;
    }
} 
