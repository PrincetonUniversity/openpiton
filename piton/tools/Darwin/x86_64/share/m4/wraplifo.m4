dnl Redefine m4wrap to have LIFO semantics.
define(`_m4wrap_level', `0')dnl
define(`_m4wrap', defn(`m4wrap'))dnl
define(`m4wrap',
`ifdef(`m4wrap'_m4wrap_level,
       `define(`m4wrap'_m4wrap_level,
               `$1'defn(`m4wrap'_m4wrap_level))',
       `_m4wrap(`define(`_m4wrap_level', incr(_m4wrap_level))dnl
m4wrap'_m4wrap_level)dnl
define(`m4wrap'_m4wrap_level, `$1')')')dnl
