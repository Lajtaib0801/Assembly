                includelib  kernel32.Lib    ;Linkages for Windows APIs (kernel32 contains the 64bit Windows functions aswell)
ExitProcess     proto                       ;'proto' tells the compiler that 'ExitProcess' is an external function that'll be used later
                .code                       ;Marks the beginning of X86-64 instructions
main            proc                        ;Program's external name (main), entry point for the linker, like the main() in C
                mov			rcx, 78         ;Load exit status code into RCX
                call        ExitProcess     ;Return CPU control to Windows
main            endp                        ;Endprocedure
                end                         ;end directive marks the end of this program
