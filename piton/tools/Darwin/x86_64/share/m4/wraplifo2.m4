dnl Redefine m4wrap to have LIFO semantics, improved example.
include(`join.m4')dnl
define(`_m4wrap', defn(`m4wrap'))dnl
define(`_arg1', `$1')dnl
define(`m4wrap',
`ifdef(`_$0_text',
       `define(`_$0_text', joinall(` ', $@)defn(`_$0_text'))',
       `_$0(`_arg1(defn(`_$0_text')undefine(`_$0_text'))')dnl
define(`_$0_text', joinall(` ', $@))')')dnl
