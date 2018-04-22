#![feature(lang_items)]
#![no_std]
#![no_main]

// Linux
#[no_mangle]
pub extern "C" fn _start() -> ! {
    loop {}
}

// Windows
#[no_mangle]
pub extern "C" fn mainCRTStartup() -> ! {
    main()
}

// MacOS
#[no_mangle]
pub extern "C" fn main() -> ! {
    loop {}
}

#[lang = "panic_fmt"]
#[no_mangle]
pub extern "C" fn rust_begin_panic(_msg: core::fmt::Arguments,
    _file: &'static str, _line: u32, _column: u32) -> !
{
    loop {}
}