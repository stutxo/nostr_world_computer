// #![no_std]

// #[panic_handler]
// fn handle_panic(_: &core::panic::PanicInfo) -> ! {
//     loop {}
// }

#[no_mangle]
pub extern "C" fn world_computer() -> u32 {
    42
}
