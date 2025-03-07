module nft_rental::simple_nft {
    use sui::object;
    use sui::transfer;
    use sui::tx_context;
    use std::string;
    
    public struct NFT has key, store {
        id: object::UID,
        name: string::String,
        description: string::String,
        url: string::String,
    }
    
    public entry fun create_nft(
        name: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,
        ctx: &mut tx_context::TxContext
    ) {
        let nft = NFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: string::utf8(url),
        };
        
        transfer::transfer(nft, tx_context::sender(ctx));
    }
}