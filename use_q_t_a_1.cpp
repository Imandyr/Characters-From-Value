// Use of the quad_to_ascii assembly function inside the C++ code.

#include <iostream>


// The declaration for the function.
extern "C" void quad_to_ascii(uint64_t, char[]);


int main() {

    // Create the input.
    uint64_t value = 1233274012489;
    char output[50]{};
    auto pointer = output + 49;

    // Use the function.
    quad_to_ascii(value, pointer);

    // Print the output.
    for (auto begin = output, end = output + 50; begin != end; ++begin)
        std::cout << *begin;
    std::cout << "\n";

    return 0;
}
