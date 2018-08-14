divert(`-1')
# curry(macro, args)
# Expand to a macro call that takes one argument, then invoke
# macro(args, extra).
define(`curry', `$1(shift($@,)_$0')
define(`_curry', ``$1')')
divert`'dnl
