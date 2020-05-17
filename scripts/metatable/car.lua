local serpent = require('vendor/serpent')

local Metatable = {
    make = 'Default',
    __index = { model = 'Default' }
}

-- setmetatable(Metatable,Metatable)


local Car = {
    __class = 'Car',
    __index = Metatable
}

setmetatable(Car,Car)

print('make: ', Car['make'])
print('model: ', Car['model'])


return Car


