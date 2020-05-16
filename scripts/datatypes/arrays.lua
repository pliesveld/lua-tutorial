workdays = {"monday", "tuesday", "wednesday", "thursday", "friday"}

repeat
    for k,v in ipairs(workdays) do
        print(v)
    end

    print('taking ', table.remove(workdays,1), 'off')
until #workdays == 0

