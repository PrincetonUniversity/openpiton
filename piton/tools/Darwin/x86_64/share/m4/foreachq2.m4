include(`quote.m4')dnl
divert(`-1')
# foreachq(x, `item_1, item_2, ..., item_n', stmt)
#   quoted list, improved version
define(`foreachq', `pushdef(`$1')_$0($@)popdef(`$1')')
define(`_arg1q', ``$1'')
define(`_rest', `ifelse(`$#', `1', `', `dquote(shift($@))')')
define(`_foreachq', `ifelse(`$2', `', `',
  `define(`$1', _arg1q($2))$3`'$0(`$1', _rest($2), `$3')')')
divert`'dnl
