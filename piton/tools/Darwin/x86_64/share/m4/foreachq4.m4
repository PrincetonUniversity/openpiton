include(`forloop2.m4')dnl
divert(`-1')
# foreachq(x, `item_1, item_2, ..., item_n', stmt)
#   quoted list, version based on forloop
define(`foreachq',
`ifelse(`$2', `', `', `_$0(`$1', `$3', $2)')')
define(`_foreachq',
`pushdef(`$1', forloop(`$1', `3', `$#',
  `$0_(`1', `2', indir(`$1'))')`popdef(
    `$1')')indir(`$1', $@)')
define(`_foreachq_',
``define(`$$1', `$$3')$$2`''')
divert`'dnl
