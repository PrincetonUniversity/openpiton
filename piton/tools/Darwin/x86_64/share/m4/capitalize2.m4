divert(`-1')
# upcase(text)
# downcase(text)
# capitalize(text)
#   change case of text, improved version
define(`upcase', `translit(`$*', `a-z', `A-Z')')
define(`downcase', `translit(`$*', `A-Z', `a-z')')
define(`_arg1', `$1')
define(`_to_alt', `changequote(`<<[', `]>>')')
define(`_from_alt', `changequote(<<[`]>>, <<[']>>)')
define(`_upcase_alt', `translit(<<[$*]>>, <<[a-z]>>, <<[A-Z]>>)')
define(`_downcase_alt', `translit(<<[$*]>>, <<[A-Z]>>, <<[a-z]>>)')
define(`_capitalize_alt',
  `regexp(<<[$1]>>, <<[^\(\w\)\(\w*\)]>>,
    <<[_upcase_alt(<<[<<[\1]>>]>>)_downcase_alt(<<[<<[\2]>>]>>)]>>)')
define(`capitalize',
  `_arg1(_to_alt()patsubst(<<[<<[$*]>>]>>, <<[\w+]>>,
    _from_alt()`]>>_$0_alt(<<[\&]>>)<<['_to_alt())_from_alt())')
divert`'dnl
