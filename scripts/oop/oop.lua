local Meeting = require("Meeting")

assert(Meeting ~= nil)
assert(type(Meeting) == 'table' and Meeting['new'] and type(Meeting['new']) == 'function')

meeting = Meeting:new{
    start = os.time() - 442214,
    duration = '30',
    people = {'John', 'Jason'}
}

meeting:addPeople('Jaccob','Jim')
print(meeting:meetingTime());

meeting2 = Meeting:new{
    start = os.time(),
    duration = '15',
    people = {'Jill'}
}

meeting2:addPeople('John','Jim')
print(meeting2:meetingTime());
