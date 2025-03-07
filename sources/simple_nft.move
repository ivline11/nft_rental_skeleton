module nft_rental::simple_nft {
    use sui::object;
    use sui::transfer;
    use sui::tx_context;
    use std::string;
    
    public struct NFT has key, store {
        //TODO
    }
    
    public entry fun create_nft(
        name: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,
        ctx: &mut tx_context::TxContext
    ) {
        //TODO
    }
}