# CodeGuruXtreme
code guru Xtreme code

the strategy:
a zombie controller `zcer`
and a attacker   

the zcer will need to know where the attacker is.
to so we need to include the following lines at start of his code:
```x86asm
push es
push ds
pop es
pop ds

lodsw
```
and put a `stosw` at the start of the attacker\`s code.\n
note that those lines will swap between es and ds
