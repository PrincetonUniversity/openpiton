include(`quote.m4')dnl
divert(`-1')
# foreachq(x, `item_1, item_2, ..., item_n', stmt)
#   quoted list, simple version
define(`foreachq', `pushdef(`$1')_foreachq($@)popdef(`$1')')
define(`_arg1', `$1')
define(`_foreachq', `ifelse(quote($2), `', `',
  `define(`$1', `_arg1($2)')$3`'$0(`$1', `shift($2)', `$3')')')
divert`'dnl
