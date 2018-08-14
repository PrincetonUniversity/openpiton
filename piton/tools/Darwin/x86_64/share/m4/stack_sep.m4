divert(`-1')
# stack_foreach_sep(macro, pre, post, sep)
# Invoke PRE`'defn`'POST with a single argument of each definition
# from the definition stack of MACRO, starting with the oldest, and
# separated by SEP between definitions.
define(`stack_foreach_sep',
`_stack_reverse_sep(`$1', `tmp-$1')'dnl
`_stack_reverse_sep(`tmp-$1', `$1', `$2`'defn(`$1')$3', `$4`'')')
# stack_foreach_sep_lifo(macro, pre, post, sep)
# Like stack_foreach_sep, but starting with the newest definition.
define(`stack_foreach_sep_lifo',
`_stack_reverse_sep(`$1', `tmp-$1', `$2`'defn(`$1')$3', `$4`'')'dnl
`_stack_reverse_sep(`tmp-$1', `$1')')
define(`_stack_reverse_sep',
`ifdef(`$1', `pushdef(`$2', defn(`$1'))$3`'popdef(`$1')$0(
  `$1', `$2', `$4$3')')')
divert`'dnl
