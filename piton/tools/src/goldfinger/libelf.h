/* copyright (C) 1998, 1999, 2000, 2002, 2004, 2005, 2006, 2007 Red Hat, Inc.
   This file is part of Red Hat elfutils.

   Red Hat elfutils is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by the
   Free Software Foundation; version 2 of the License.

   Red Hat elfutils is distributed in the hope that it will be useful, but
   WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   General Public License for more details.

   You should have received a copy of the GNU General Public License along
   with Red Hat elfutils; if not, write to the Free Software Foundation,
   Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301 USA.

   In addition, as a special exception, Red Hat, Inc. gives You the
   additional right to link the code of Red Hat elfutils with code licensed
   under any Open Source Initiative certified open source license
   (http://www.opensource.org/licenses/index.php) which requires the
   distribution of source code with any binary distribution and to
   distribute linked combinations of the two.  Non-GPL Code permitted under
   this exception must only link to the code of Red Hat elfutils through
   those well defined interfaces identified in the file named EXCEPTION
   found in the source code files (the "Approved Interfaces").  The files
   of Non-GPL Code may instantiate templates or use macros or inline
   functions from the Approved Interfaces without causing the resulting
   work to be covered by the GNU General Public License.  Only Red Hat,
   Inc. may make changes or additions to the list of Approved Interfaces.
   Red Hat's grant of this exception is conditioned upon your not adding
   any new exceptions.  If you wish to add a new Approved Interface or
   exception, please contact Red Hat.  You must obey the GNU General Public
   License in all respects for all of the Red Hat elfutils code and other
   code used in conjunction with Red Hat elfutils except the Non-GPL Code
   covered by this exception.  If you modify this file, you may extend this
   exception to your version of the file, but you are not obligated to do
   so.  If you do not wish to provide this exception without modification,
   you must delete this exception statement from your version and license
   this file solely under the GPL without exception.

   Red Hat elfutils is an included package of the Open Invention Network.
   An included package of the Open Invention Network is a package for which
   Open Invention Network licensees cross-license their patents.  No patent
   license is granted, either expressly or impliedly, by designation as an
   included package.  Should you wish to participate in the Open Invention
   Network licensing program, please visit www.openinventionnetwork.com
   <http://www.openinventionnetwork.com>.  */

#ifndef _LIBELF_H
#define _LIBELF_H 1

#include <sys/types.h>

/* Get the ELF types.  */
#ifdef MACOS
#include <gelf.h>
#else
#include <elf.h>
#endif


/* Known translation types.  */
typedef enum
{
  ELF_T_BYTE,                   /* unsigned char */
  ELF_T_ADDR,                   /* Elf32_Addr, Elf64_Addr, ... */
  ELF_T_DYN,                    /* Dynamic section record.  */
  ELF_T_EHDR,                   /* ELF header.  */
  ELF_T_HALF,                   /* Elf32_Half, Elf64_Half, ... */
  ELF_T_OFF,                    /* Elf32_Off, Elf64_Off, ... */
  ELF_T_PHDR,                   /* Program header.  */
  ELF_T_RELA,                   /* Relocation entry with addend.  */
  ELF_T_REL,                    /* Relocation entry.  */
  ELF_T_SHDR,                   /* Section header.  */
  ELF_T_SWORD,                  /* Elf32_Sword, Elf64_Sword, ... */
  ELF_T_SYM,                    /* Symbol record.  */
  ELF_T_WORD,                   /* Elf32_Word, Elf64_Word, ... */
  ELF_T_XWORD,                  /* Elf32_Xword, Elf64_Xword, ... */
  ELF_T_SXWORD,                 /* Elf32_Sxword, Elf64_Sxword, ... */
  ELF_T_VDEF,                   /* Elf32_Verdef, Elf64_Verdef, ... */
  ELF_T_VDAUX,                  /* Elf32_Verdaux, Elf64_Verdaux, ... */
  ELF_T_VNEED,                  /* Elf32_Verneed, Elf64_Verneed, ... */
  ELF_T_VNAUX,                  /* Elf32_Vernaux, Elf64_Vernaux, ... */
  ELF_T_NHDR,                   /* Elf32_Nhdr, Elf64_Nhdr, ... */
  ELF_T_SYMINFO,                /* Elf32_Syminfo, Elf64_Syminfo, ... */
  ELF_T_MOVE,                   /* Elf32_Move, Elf64_Move, ... */
  ELF_T_LIB,                    /* Elf32_Lib, Elf64_Lib, ... */
  ELF_T_GNUHASH,                /* GNU-style hash section.  */
  ELF_T_AUXV,                   /* Elf32_auxv_t, Elf64_auxv_t, ... */
  /* Keep this the last entry.  */
  ELF_T_NUM
} Elf_Type;

/* Descriptor for data to be converted to or from memory format.  */
typedef struct
{
  void *d_buf;                  /* Pointer to the actual data.  */
  Elf_Type d_type;              /* Type of this piece of data.  */
  unsigned int d_version;       /* ELF version.  */
  size_t d_size;                /* Size in bytes.  */
  /* ANDROID_CHANGE_BEGIN */
#if 0
  loff_t d_off;                 /* Offset into section.  */
#else
  off_t d_off;                  /* Offset into section.  */
#endif
  /* ANDROID_CHANGE_END */
  size_t d_align;               /* Alignment in section.  */
} Elf_Data;


/* Commands for `...'.  */
typedef enum
{
  ELF_C_NULL,                   /* Nothing, terminate, or compute only.  */
  ELF_C_READ,                   /* Read .. */
  ELF_C_RDWR,                   /* Read and write .. */
  ELF_C_WRITE,                  /* Write .. */
  ELF_C_CLR,                    /* Clear flag.  */
  ELF_C_SET,                    /* Set flag.  */
  ELF_C_FDDONE,                 /* Signal that file descriptor will not be
                                   used anymore.  */
  ELF_C_FDREAD,                 /* Read rest of data so that file descriptor
                                   is not used anymore.  */
  /* The following are extensions.  */
  ELF_C_READ_MMAP,              /* Read, but mmap the file if possible.  */
  ELF_C_RDWR_MMAP,              /* Read and write, with mmap.  */
  ELF_C_WRITE_MMAP,             /* Write, with mmap.  */
  ELF_C_READ_MMAP_PRIVATE,      /* Read, but memory is writable, results are
                                   not written to the file.  */
  ELF_C_EMPTY,                  /* Copy basic file data but not the content. */
  /* Keep this the last entry.  */
  ELF_C_NUM
} Elf_Cmd;


/* Flags for the ELF structures.  */
enum
{
  ELF_F_DIRTY = 0x1,
#define ELF_F_DIRTY             ELF_F_DIRTY
  ELF_F_LAYOUT = 0x4,
#define ELF_F_LAYOUT            ELF_F_LAYOUT
  ELF_F_PERMISSIVE = 0x8
#define ELF_F_PERMISSIVE        ELF_F_PERMISSIVE
};


/* Identification values for recognized object files.  */
typedef enum
{
  ELF_K_NONE,                   /* Unknown.  */
  ELF_K_AR,                     /* Archive.  */
  ELF_K_COFF,                   /* Stupid old COFF.  */
  ELF_K_ELF,                    /* ELF file.  */
  /* Keep this the last entry.  */
  ELF_K_NUM
} Elf_Kind;


/* Archive member header.  */
typedef struct
{
  char *ar_name;                /* Name of archive member.  */
  time_t ar_date;               /* File date.  */
  uid_t ar_uid;                 /* User ID.  */
  gid_t ar_gid;                 /* Group ID.  */
  mode_t ar_mode;               /* File mode.  */
  /* ANDROID_CHANGE_BEGIN */
#if 0
  loff_t ar_size;               /* File size.  */
#else
  off_t ar_size;                /* File size.  */
#endif
  /* ANDROID_CHANGE_END */
  char *ar_rawname;             /* Original name of archive member.  */
} Elf_Arhdr;


/* Archive symbol table entry.  */
typedef struct
{
  char *as_name;                /* Symbol name.  */
  size_t as_off;                /* Offset for this file in the archive.  */
  unsigned long int as_hash;    /* Hash value of the name.  */
} Elf_Arsym;


/* Descriptor for the ELF file.  */
typedef struct Elf Elf;

/* Descriptor for ELF file section.  */
typedef struct Elf_Scn Elf_Scn;


#ifdef __cplusplus
extern "C" {
#endif

/* Return descriptor for ELF file to work according to CMD.  */
extern Elf *elf_begin (int __fildes, Elf_Cmd __cmd, Elf *__ref);

/* Create a clone of an existing ELF descriptor.  */
  extern Elf *elf_clone (Elf *__elf, Elf_Cmd __cmd);

/* Create descriptor for memory region.  */
extern Elf *elf_memory (char *__image, size_t __size);

/* Advance archive descriptor to next element.  */
extern Elf_Cmd elf_next (Elf *__elf);

/* Free resources allocated for ELF.  */
extern int elf_end (Elf *__elf);

/* Update ELF descriptor and write file to disk.  */
/* ANDROID_CHANGE_BEGIN */
#if 0
extern off_t elf_update (Elf *__elf, Elf_Cmd __cmd);
#else
#endif
/* ANDROID_CHANGE_END */


/* Determine what kind of file is associated with ELF.  */
extern Elf_Kind elf_kind (Elf *__elf) __attribute__ ((__pure__));

/* Get the base offset for an object file.  */
/* ANDROID_CHANGE_BEGIN */
#if 0
extern loff_t elf_getbase (Elf *__elf);
#else
extern off_t elf_getbase (Elf *__elf);
#endif
/* ANDROID_CHANGE_END */


/* Retrieve file identification data.  */
extern char *elf_getident (Elf *__elf, size_t *__nbytes);

/* Retrieve class-dependent object file header.  */
extern Elf32_Ehdr *elf32_getehdr (Elf *__elf);
/* Similar but this time the binary calls is ELFCLASS64.  */
extern Elf64_Ehdr *elf64_getehdr (Elf *__elf);

/* Create ELF header if none exists.  */
extern Elf32_Ehdr *elf32_newehdr (Elf *__elf);
/* Similar but this time the binary calls is ELFCLASS64.  */
extern Elf64_Ehdr *elf64_newehdr (Elf *__elf);

/* Retrieve class-dependent program header table.  */
extern Elf32_Phdr *elf32_getphdr (Elf *__elf);
/* Similar but this time the binary calls is ELFCLASS64.  */
extern Elf64_Phdr *elf64_getphdr (Elf *__elf);

/* Create ELF program header.  */
extern Elf32_Phdr *elf32_newphdr (Elf *__elf, size_t __cnt);
/* Similar but this time the binary calls is ELFCLASS64.  */
extern Elf64_Phdr *elf64_newphdr (Elf *__elf, size_t __cnt);


/* Get section at INDEX.  */
extern Elf_Scn *elf_getscn (Elf *__elf, size_t __index);

/* Get section at OFFSET.  */
extern Elf_Scn *elf32_offscn (Elf *__elf, Elf32_Off __offset);
/* Similar bug this time the binary calls is ELFCLASS64.  */
extern Elf_Scn *elf64_offscn (Elf *__elf, Elf64_Off __offset);

/* Get index of section.  */
extern size_t elf_ndxscn (Elf_Scn *__scn);

/* Get section with next section index.  */
extern Elf_Scn *elf_nextscn (Elf *__elf, Elf_Scn *__scn);

/* Create a new section and append it at the end of the table.  */
extern Elf_Scn *elf_newscn (Elf *__elf);

/* Get the section index of the extended section index table for the
   given symbol table.  */
extern int elf_scnshndx (Elf_Scn *__scn);

/* Get the number of sections in the ELF file.  If the file uses more
   sections than can be represented in the e_shnum field of the ELF
   header the information from the sh_size field in the zeroth section
   header is used.  */
extern int elf_getshnum (Elf *__elf, size_t *__dst);


/* Get the section index of the section header string table in the ELF
   file.  If the index cannot be represented in the e_shnum field of
   the ELF header the information from the sh_link field in the zeroth
   section header is used.  */
extern int elf_getshstrndx (Elf *__elf, size_t *__dst);


/* Retrieve section header of ELFCLASS32 binary.  */
extern Elf32_Shdr *elf32_getshdr (Elf_Scn *__scn);
/* Similar for ELFCLASS64.  */
extern Elf64_Shdr *elf64_getshdr (Elf_Scn *__scn);


/* Set or clear flags for ELF file.  */
extern unsigned int elf_flagelf (Elf *__elf, Elf_Cmd __cmd,
                                 unsigned int __flags);
/* Similarly for the ELF header.  */
extern unsigned int elf_flagehdr (Elf *__elf, Elf_Cmd __cmd,
                                  unsigned int __flags);
/* Similarly for the ELF program header.  */
extern unsigned int elf_flagphdr (Elf *__elf, Elf_Cmd __cmd,
                                  unsigned int __flags);
/* Similarly for the given ELF section.  */
extern unsigned int elf_flagscn (Elf_Scn *__scn, Elf_Cmd __cmd,
                                 unsigned int __flags);
/* Similarly for the given ELF data.  */
extern unsigned int elf_flagdata (Elf_Data *__data, Elf_Cmd __cmd,
                                  unsigned int __flags);
/* Similarly for the given ELF section header.  */
extern unsigned int elf_flagshdr (Elf_Scn *__scn, Elf_Cmd __cmd,
                                  unsigned int __flags);


/* Get data from section while translating from file representation
   to memory representation.  */
extern Elf_Data *elf_getdata (Elf_Scn *__scn, Elf_Data *__data);

/* Get uninterpreted section content.  */
extern Elf_Data *elf_rawdata (Elf_Scn *__scn, Elf_Data *__data);

/* Create new data descriptor for section SCN.  */
extern Elf_Data *elf_newdata (Elf_Scn *__scn);

/* Get data translated from a chunk of the file contents as section data
   would be for TYPE.  The resulting Elf_Data pointer is valid until
   elf_end (ELF) is called.  */
/* ANDROID_CHANGE_BEGIN */
#if 0
extern Elf_Data *elf_getdata_rawchunk (Elf *__elf,
                                       loff_t __offset, size_t __size,
                                       Elf_Type __type);
#else
extern Elf_Data *elf_getdata_rawchunk (Elf *__elf,
                                       off_t __offset, size_t __size,
                                       Elf_Type __type);
#endif
/* ANDROID_CHANGE_END */


/* Return pointer to string at OFFSET in section INDEX.  */
extern char *elf_strptr (Elf *__elf, size_t __index, size_t __offset);


/* Return header of archive.  */
extern Elf_Arhdr *elf_getarhdr (Elf *__elf);

/* Return offset in archive for current file ELF.  */
/* ANDROID_CHANGE_BEGIN */
#if 0
extern loff_t elf_getaroff (Elf *__elf);
#else
extern off_t elf_getaroff (Elf *__elf);
#endif
/* ANDROID_CHANGE_END */

/* Select archive element at OFFSET.  */
extern size_t elf_rand (Elf *__elf, size_t __offset);

/* Get symbol table of archive.  */
extern Elf_Arsym *elf_getarsym (Elf *__elf, size_t *__narsyms);


/* Control ELF descriptor.  */
extern int elf_cntl (Elf *__elf, Elf_Cmd __cmd);

/* Retrieve uninterpreted file contents.  */
extern char *elf_rawfile (Elf *__elf, size_t *__nbytes);


/* Return size of array of COUNT elements of the type denoted by TYPE
   in the external representation.  The binary class is taken from ELF.
   The result is based on version VERSION of the ELF standard.  */
extern size_t elf32_fsize (Elf_Type __type, size_t __count,
                           unsigned int __version)
       __attribute__ ((__const__));
/* Similar but this time the binary calls is ELFCLASS64.  */
extern size_t elf64_fsize (Elf_Type __type, size_t __count,
                           unsigned int __version)
       __attribute__ ((__const__));


/* Convert data structure from the representation in the file represented
   by ELF to their memory representation.  */
extern Elf_Data *elf32_xlatetom (Elf_Data *__dest, const Elf_Data *__src,
                                 unsigned int __encode);
/* Same for 64 bit class.  */
extern Elf_Data *elf64_xlatetom (Elf_Data *__dest, const Elf_Data *__src,
                                 unsigned int __encode);

/* Convert data structure from to the representation in memory
   represented by ELF file representation.  */
extern Elf_Data *elf32_xlatetof (Elf_Data *__dest, const Elf_Data *__src,
                                 unsigned int __encode);
/* Same for 64 bit class.  */
extern Elf_Data *elf64_xlatetof (Elf_Data *__dest, const Elf_Data *__src,
                                 unsigned int __encode);


/* Return error code of last failing function call.  This value is kept
   separately for each thread.  */
extern int elf_errno (void);

/* Return error string for ERROR.  If ERROR is zero, return error string
   for most recent error or NULL is none occurred.  If ERROR is -1 the
   behaviour is similar to the last case except that not NULL but a legal
   string is returned.  */
extern const char *elf_errmsg (int __error);


/* Coordinate ELF library and application versions.  */
extern unsigned int elf_version (unsigned int __version);

/* Set fill bytes used to fill holes in data structures.  */
extern void elf_fill (int __fill);

/* Compute hash value.  */
extern unsigned long int elf_hash (const char *__string)
       __attribute__ ((__pure__));

/* Compute hash value using the GNU-specific hash function.  */
extern unsigned long int elf_gnu_hash (const char *__string)
       __attribute__ ((__pure__));


/* Compute simple checksum from permanent parts of the ELF file.  */
extern long int elf32_checksum (Elf *__elf);
/* Similar but this time the binary calls is ELFCLASS64.  */
extern long int elf64_checksum (Elf *__elf);

#ifdef __cplusplus
}
#endif

#endif  /* libelf.h */

