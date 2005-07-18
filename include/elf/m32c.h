/* M32C ELF support for BFD.
   Copyright (C) 2004 Free Software Foundation, Inc.

This file is part of BFD, the Binary File Descriptor library.

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software Foundation, Inc.,
59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.  */

#ifndef _ELF_M32C_H
#define _ELF_M32C_H

#include "elf/reloc-macros.h"

  /* Relocations.  */
  START_RELOC_NUMBERS (elf_m32c_reloc_type)
     RELOC_NUMBER (R_M32C_NONE, 0)
     RELOC_NUMBER (R_M32C_16, 1)
     RELOC_NUMBER (R_M32C_24, 2)
     RELOC_NUMBER (R_M32C_32, 3)
     RELOC_NUMBER (R_M32C_8_PCREL, 4)
     RELOC_NUMBER (R_M32C_16_PCREL, 5)
     END_RELOC_NUMBERS (R_M32C_max)

#define EF_M32C_CPU_M16C	0x00000075      /* default */
#define EF_M32C_CPU_M32C        0x00000078      /* m32c */
#define EF_M32C_CPU_MASK	0x0000007F	/* specific cpu bits */
#define EF_M32C_ALL_FLAGS	(EF_M32C_CPU_MASK)

/* Define the data & instruction memory discriminator.  In a linked
   executable, an symbol should be deemed to point to an instruction
   if ((address & M16C_INSN_MASK) == M16C_INSN_VALUE), and similarly
   for the data space.  See also `ld/emulparams/elf32m32c.sh'.  */
#define M32C_DATA_MASK   0xffc00000
#define M32C_DATA_VALUE  0x00000000
#define M32C_INSN_MASK   0xffc00000
#define M32C_INSN_VALUE  0x00400000

#endif /* _ELF_M32C_H */