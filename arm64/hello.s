// .align 4
// .data
//
// msg:
//     .ascii        "hello, arm64!\n"
// len = . - msg
//
// .text
//
// .global _start
//
// _start:
//     mov     x0, 1      // fd := STDOUT_FILENO
//     ldr     x1, =msg    // buf := msg
//     mov     x2, 14
//     mov     x16, 4     // write is syscall #64
//     svc     128          // invoke syscall
//
//     mov     x0, 0      // status := 0
//     mov     x16, 1      // exit is syscall #1
//     svc     128          // invoke syscall
    //
// Assembler program to print "Hello World!"
// to stdout.
//
// X0-X2 - parameters to Unix system calls
// X16 - Mach System Call function number
//

.global _start			// Provide program starting address to linker
.align 2			// Make sure everything is aligned properly

// Setup the parameters to print hello world
// and then call the Kernel to do it.
_start: mov	X0, #1		// 1 = StdOut
	adr	X1, helloworld 	// string to print
	mov	X2, #13	    	// length of our string
	mov	X16, #4		// Unix write system call
	svc	#0x80		// Call kernel to output the string

// Setup the parameters to exit the program
// and then call the kernel to do it.
	mov     X0, #0		// Use 0 return code
	mov     X16, #1		// System call number 1 terminates this program
	svc     #0x80		// Call kernel to terminate the program

helloworld:      .ascii  "Hello World!\n"
