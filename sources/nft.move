module nft_tutorial::nft {
    use sui::object::{Self,UID};
    use sui::transfer;
    use sui::tx_context::{Self,TxContext};
    use std::string::String;

    struct NFT has key,store{
        id: UID,
        name: String,
        description: String,
        // image: Url,
    }

    public entry fun mint(name:String,description:String, ctx: &mut TxContext){
        //create new nft
        let nft:NFT = NFT {
            id:object::new(ctx),
            name:String,
            description:String
        };
        // send te nft to the caller
        let sender:address = tx_context::sender(self:ctx);
        // transfer nft to the caller
        transfer::public_transfer(nft, sender);
    }

    public entry fun transfer(nft: NFT, recipient:address){
        transfer::transfer(nft, recipient);
    }
}