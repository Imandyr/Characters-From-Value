# A function to convert an array with quad words into the decimal ASCII representation 1.

.globl value_size, stack_frame_size, quad_to_ascii
.type quad_to_ascii, @function


.section .data

# The size of the value with which function can work.
.equ value_size, 8
# The size of the stack frame.
.equ stack_frame_size, 16

# The divider.
.equ divider, 10
# The ascii offset.
.equ ascii_offset, 48


.section .text

quad_to_ascii:
    # This function takes a quad-word unsigned value, and converts it to the ASCII encoded decimal representation.
    # Arguments:
    #     %rdi: An unsigned quad-word.
    #     %rsi: The last address of the buffer for the output ASCII representation.
    # Returns:
    #     None.

    # Create the stack frame.
    pushq %rbp
    movq %rsp, %rbp
    subq $stack_frame_size, %rsp
    # Load the value to %rax.
    movq %rdi, %rax
    # The divider.
    movq $divider, %rcx

    processing_loop:
        # decrement the output address.
        decq %rsi
        # Set the reminder to zero.
        movq $0, %rdx
        # Divide the value by 10 to get a decimal number as the reminder.
        divq %rcx
        # Add 48 to make it a number in the ASCII encoding.
        addq $ascii_offset, %rdx
        # Move to the output.
        movb %dl, (%rsi)
        # Check if there are still values left.
        cmpq $0, %rax
        # Repeat if yes.
        jne processing_loop

    # Close the function.
    leave
    ret
