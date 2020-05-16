local Meeting = {}

local function verifyMeeting(self)
    assert(self['start'])
    assert(self['duration'])
    assert(self['people'])
    return true
end

function Meeting:meetingTime()
    verifyMeeting(self)
    local participants = table.concat(self.people,' ')

    return "The meeting is with",
        participants,
        "and starts at",
        os.date('%c',self.start) or error"Failed to parse start time",
        "and lasts until",
        os.date('%c', self.duration*60 + self.start)

end

function Meeting:hasPerson(person)
    verifyMeeting(self)
    for k,v in ipairs(self.people) do
        if person == v then
            return true
        end
    end
    return false
end

function Meeting:addPeople(...)
    verifyMeeting(self)
    local args = {...}
    for k,v in ipairs(args) do
        local person = tostring(v) or error"argument must be convertable to string"
        if self:hasPerson(person) then
            error("Person ".. person .." already attending")
        end
        table.insert(self.people, person)
    end

end

function Meeting:new(o)
    o = o or {
        start = os.time(),
        duration = '30',
        people = {}
    }

    -- round start time to half-hour
    local tm = os.date('*t', o.start)
    tm.sec = 0
    tm.min = tm.min < 29 and 0 or 30
    o.start = os.time(tm)

    setmetatable(o, self)
    self.__index = self
    return o
end

return Meeting
