define(`%%$$##', `>>>$0<<< cnt $#')

# indir(`%%$$##', nonsense, nonsense)
indir(`%%$$##', nonsense, nonsense)

# indir(`indir', `%%$$##', nonsense)
indir(`indir', `%%$$##', nonsense)

# indir(`indir', `indir', `indir', `indir', `%%$$##')
indir(`indir', `indir', `indir', `indir', `%%$$##')
