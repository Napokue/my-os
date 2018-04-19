#![feature(lang_items)]
#![feature(const_fn)]
#![feature(ptr_internals)]
#![feature(unique)]
#![no_std]

extern crate rlibc;
extern crate volatile;
extern crate spin;
extern crate multiboot2;

#[macro_use]
mod vga_buffer;

mod memory;

#[no_mangle]
pub extern fn rust_main(multiboot_information_address: usize) {
    use memory::FrameAllocator;

    vga_buffer::clear_screen();
    println!("Welcome to Mios{}", "!");
    let boot_info = unsafe{multiboot2::load(multiboot_information_address)};
    let memory_map_tag = boot_info.memory_map_tag()
        .expect("Memory map tag required");

    let elf_sections_tag = boot_info.elf_sections_tag()
        .expect("Elf-sections tag required");

    let kernel_start = elf_sections_tag.sections().map(|s|s.addr)
        .min().unwrap();

    let kernel_end = elf_sections_tag.sections().map(|s|s.addr + s.size)
        .max().unwrap();

    let multiboot_start = multiboot_information_address;
    let multiboot_end = multiboot_start + (boot_info.total_size as usize);

    println!("start{:x}", kernel_start);
    println!("end{:x}", kernel_end);
    
    println!("start{:x}", multiboot_start);
    println!("end{:x}", multiboot_end);

    let mut frame_allocator = memory::AreaFrameAllocator::new(
        kernel_start as usize, kernel_end as usize, 
        multiboot_start as usize, multiboot_end as usize, 
        memory_map_tag.memory_areas());
    for i in 0.. {
        if let None = frame_allocator.allocate_frame() {
            println!("allocated {} frames", i);
            break;
        }
    }

    loop{}
}

#[lang = "eh_personality"] extern fn eh_personality() {}

#[lang = "panic_fmt"] 
#[no_mangle] 
pub extern fn panic_fmt(fmt: core::fmt::Arguments, file: &'static str,
    line: u32) -> ! {
    println!("\n\nPANIC in {} at line {}:", file, line);
    println!("    {}", fmt);
    loop{}
}