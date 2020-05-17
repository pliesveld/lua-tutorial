
local serpent = require('vendor/serpent')



local a = {1, nil, 3, x=1, ['true'] = 2, [not true]=3}
a[a] = a -- self-reference with a table as key and value

print('full serialization:')
print(serpent.dump(a)) -- full serialization
print('single line, no self-ref section:')
print(serpent.line(a)) -- single line, no self-ref section
print('mutli-line indented, no self-ref section:')
print(serpent.block(a)) -- multi-line indented, no self-ref section

print('\n\n')

-- deserialize using loadstring
local fun, err = loadstring(serpent.dump(a))
if err then error(err) end
local copy = fun()

-- deserialize serpent.load
local ok, copy = serpent.load(serpent.dump(a))
print(ok and copy[3] == a[3])



