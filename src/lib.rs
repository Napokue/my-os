#![feature(lang_items)]
#![feature(const_fn)]
#![feature(ptr_internals)]
#![feature(unique)]
#![no_std]

extern crate rlibc;
extern crate volatile;

mod vga_buffer;

#[no_mangle]
pub extern fn rust_main() {
    vga_buffer::print_something("Ik ben super sexy");

    loop{}
}

#[lang = "eh_personality"] extern fn eh_personality() {}
#[lang = "panic_fmt"] #[no_mangle] pub extern fn panic_fmt() -> ! {loop{}}