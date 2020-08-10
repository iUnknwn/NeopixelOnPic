# Driving a NeoPixel using a Microchip PIC

This code is a simple demo of a PIC12F1572 outputing to a NeoPixel RGB LED device. 

Communication with the NeoPixel is handled by the `DisplayLoop.asm` file, which is a
handwritten assembly routine to send a byte to a NeoPixel device. This was necessary
due to the incredibly tight timing requirements of a NeoPixel. 

This code should be portable and adoptable to another PIC device, but the device
must support an clock frequency of 32 MHz, as the PIC cannot switch IO pins
faster than Mclk/4 (8MHz).