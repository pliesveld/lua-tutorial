--[[
-- Serpent Library Example
--
-- Lua serializer and pretty printer.
--
-- https://github.com/pkulchenko/serpent
--
-- Copied from the project README.md for easy reference:
--
--  Human readable:
--   Provides single-line and multi-line output.
--   Nested tables are properly indented in the multi-line output.
--   Numerical keys are listed first.
--   Keys are (optionally) sorted alphanumerically.
--   Array part skips keys ({'a', 'b'} instead of {[1] = 'a', [2] = 'b'}).
--   nil values are included when expected ({1, nil, 3} instead of {1, [3]=3}).
--   Keys use short notation ({foo = 'foo'} instead of {['foo'] = 'foo'}).
--   Shared references and self-references are marked in the output.
--   Machine readable: provides reliable deserialization using loadstring().
--   Supports deeply nested tables.
--   Supports tables with self-references.
--   Keeps shared tables and functions shared after de/serialization.
--   Supports function serialization using string.dump().
--   Supports serialization of global functions.
--   Supports __tostring and __serialize metamethods.
--   Escapes new-line \010 and end-of-file control \026 characters in strings.
--   Configurable with options and custom formatters.
--]]

local serpent = require('vendor/serpent')

local a = {1, nil, 3, x=1, ['true'] = 2, [not true]=3}
a[a] = a -- self-reference with a table as key and value

print("table a:")
print("local a = {1, nil, 3, x=1, ['true'] = 2, [not true]=3}")
print("a[a] = a -- self-reference with a table as key and value")
print(a)
--print(a[a])
print("\n\n")

print('\nfull serialization:')
print(serpent.dump(a)) -- full serialization
print('\nsingle line, no self-ref section:')
print(serpent.line(a)) -- single line, no self-ref section
print('\nmutli-line indented, no self-ref section:')
print(serpent.block(a)) -- multi-line indented, no self-ref section

print('\n\n')

-- for key,value in pairs(a) do print(key, value) end
-- for key,value in ipairs(a) do print(key, value) end

-- deserialize using loadstring
local fun, err = loadstring(serpent.dump(a))
if err then error(err) end
local copy = fun()
assert(fun and copy[3] == a[3])

-- deserialize serpent.load
local ok, copy = serpent.load(serpent.dump(a))
assert(ok and copy[3] == a[3])


