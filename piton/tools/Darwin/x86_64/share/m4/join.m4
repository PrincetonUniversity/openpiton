divert(`-1')
# join(sep, args) - join each non-empty ARG into a single
# string, with each element separated by SEP
define(`join',
`ifelse(`$#', `2', ``$2'',
  `ifelse(`$2', `', `', ``$2'_')$0(`$1', shift(shift($@)))')')
define(`_join',
`ifelse(`$#$2', `2', `',
  `ifelse(`$2', `', `', ``$1$2'')$0(`$1', shift(shift($@)))')')
# joinall(sep, args) - join each ARG, including empty ones,
# into a single string, with each element separated by SEP
define(`joinall', ``$2'_$0(`$1', shift($@))')
define(`_joinall',
`ifelse(`$#', `2', `', ``$1$3'$0(`$1', shift(shift($@)))')')
divert`'dnl
