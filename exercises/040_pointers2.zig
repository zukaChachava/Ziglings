//
// It's important to note that variable pointers and constant pointers
// are different types.
//
// Given:
//
//     var foo: u8 = 5;
//     const bar: u8 = 5;
//
// Then:
//
//     &foo is of type "*u8"
//     &bar is of type "*const u8"
//
// You can always make a const pointer to a mutable value (var), but
// you cannot make a var pointer to an immutable value (const).
// This sounds like a logic puzzle, but it just means that once data
// is declared immutable, you can't coerce it to a mutable type.
// Think of mutable data as being volatile or even dangerous. Zig
// always lets you be "more safe" and never "less safe."
//
const std = @import("std");

pub fn main() void {
    var a: u8 = 12;
    const b: *const u8 = &a; 
    const z: *u8 = &a; 

    z.* += 1;
    // b.* += 1;

    std.debug.print("a: {}, b: {}, z: {}\n", .{ a, b.*, z.* });
}
