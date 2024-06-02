# Use of the quad_to_ascii_1.s.

.globl _start


.section .data

output_buffer:
    .quad 0, 0, 0, 0, 0
    .byte '\n'
output_buffer_end:

.equ output_buffer_size, output_buffer_end - output_buffer
.equ output_buffer_last_address, output_buffer_end-2


.section .text

_start:

function_use:
    # Call the conversion function on input values.
    movq $12340124323556789, %rdi
    movq $output_buffer_last_address, %rsi
    call quad_to_ascii

print_output:
    # Write output_buffer to the stdout.
    movq $1, %rax
    movq $1, %rdi
    movq $output_buffer, %rsi
    movq $output_buffer_size, %rdx
    syscall

exit:
    # Exit the program.
    movq $0, %rdi
    movq $60, %rax
    syscall
