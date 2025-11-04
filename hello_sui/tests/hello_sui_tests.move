#[test_only]
module hello_world::hello_world_tests {
    use hello_world::hello_world::{Self, HelloWorldObject};
    use sui::test_scenario;

    #[test]
    public fun test_mint() {
        let addr1 = @0xA;

        let mut scenario = test_scenario::begin(addr1);
        {
            hello_world::mint(test_scenario::ctx(&mut scenario));
        };

        test_scenario::next_tx(&mut scenario, addr1);
        {
            assert!(test_scenario::has_most_recent_for_sender<HelloWorldObject>(&scenario), 0);
        };

        test_scenario::end(scenario);
    }
}