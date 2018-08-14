divert(`-1')
# foreachq(x, `item_1, item_2, ..., item_n', stmt)
#   quoted list, alternate improved version
define(`foreachq', `ifelse(`$2', `', `',
  `pushdef(`$1')_$0(`$1', `$3', `', $2)popdef(`$1')')')
define(`_foreachq', `ifelse(`$#', `3', `',
  `define(`$1', `$4')$2`'$0(`$1', `$2',
    shift(shift(shift($@))))')')
divert`'dnl
