    module hello_world::hello_world {
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use std::string;

    /// Uma estrutura simples que contém uma mensagem
    public struct HelloWorldObject has key, store {
        id: UID,
        text: string::String
    }

    /// Função pública para criar um novo HelloWorldObject
    public fun mint(ctx: &mut TxContext) {
        let object = HelloWorldObject {
            id: object::new(ctx),
            text: string::utf8(b"Hello World!")
        };
        transfer::public_transfer(object, tx_context::sender(ctx));
    }
}