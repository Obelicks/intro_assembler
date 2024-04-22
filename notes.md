# Intro to assembly language
## Language

**assembler**: add rax, 1 == **shellcode**: 4883C001

**shellcode** is a hex representation fo **machine code**.

![Compilation_Stage](compilation_stage.png)

## Types of assembly
* intel x86
* ARM
    * M1
    * Mobile

[Von Neumann Architechture](https://en.wikipedia.org/wiki/Von_Neumann_architecture)

![Compilation_Stage](von_neumann_arch.jpg)

* Central Processing Unit
    * Control Unit
    * Arithmic/Logic Unit

* Memory
    * cache level 1-3 (fast)
    * Random Access Memory (slower)

## Cache
Located within the CPU itself, which in computer terms is lightyears closer than the RAM

* **level 1** kilobyte size fastest cache (slower than registers) per core 
* **level 2** megabytes shared between cores
* **level 3** megabytes (larger than l2), not all cpus have l3 

## RAM
Much larger than cache and much slower.

**Comparison**
| Memory Type | Cycles to Read |
| ----------- | ----------- |
| Registry | 1 |
| Cache | a few |
| RAM  | around 200 |


### Structure 
![Memory Stucture](memory_structure.jpg)
* **Stack** Last-in First-Out data can only be accessed with push and pop
* **Heap** data can be stored and read in any order. But is slower than stack
* **Data** data and .bss which respectivly is assinged variables and unassigned variables (buffers)
* **Text** Assembly instructions for the CPU to read

This segmentation is true for the entire systems RAM however each program/application is given its own VRAM so each application/program has its own stack, heap, data and text.

## I/O
The Input/Output include: keyboard, screen, long term storage units (hdd,ssd).

The processor access these devices using the Bus Interface which is a highway for data and addresses.

Accessing a long term storage unit is slower than accessing a RAM mainly due to the fact that this kind of storage isnt volatile like RAM. The benefit of long term storage is that unlike RAM, cache and registers that after a reboot, the data on long term storage units persists while RAM etc. is wiped.

## CPU architecture

**RISC:**
Many simple instructions with more cycles yet cycles are faster and less power consuming

**CISC:**
Complex instruction with less and slower cycles and more power consumption

### Clock speed and cycle
Speed is denoted in Hertz today typically GHz which is to say how many ***billion*** cycles a second a processor performs. 4.3 GHz = 4.300.000.000 cycles a second. THATS A LOT!

Note that modern cpu's also have multiple cores running in paralel, so a 4 core at 4.3 GHz is effectively running 17,2 billion cycles a second.

### Instruction Cycle
An instruction Cycle is the cycle it takes for the cpu to process a single machine instruction

![Assembly](assembly_instruction_cycle.jpg)

* **Fetch** IAR (Instruction Address Register)
* **Decode** Instructions from binary 
* **Execute** Fetch instruction operands from register/memory and process 
* **Store** new value in destination operand

***Note:*** All of the stages in the instruction cycle are carried out by the Control Unit, except when arithmetic instructions need to be executed "add, sub, ..etc", which are executed by the ALU.

Each Instruction Cycle takes multiple clock cycles to finish. The amount of clock cycles it takes varies from instruction and CPU architecture. 

**Example:**
If we were to execute the assembly instruction 
`add rax, 1`
, it would run through an instruction cycle:

Fetch the instruction from the rip register, 48 83 C0 01 (in binary).
Decode '48 83 C0 01' to know it needs to perform an add of 1 to the value at rax.
Get the current value at rax (by CU), add 1 to it (by the ALU).
Store the new value back to rax.

## Processor Specific
