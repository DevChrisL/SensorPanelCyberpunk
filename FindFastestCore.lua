function FindFastestCore()
    local highestValue = nil
    local fastestCoreIndex = nil

    for i = 0, 15 do
        -- Get the value of each measure (e.g., "MeasureCPUCore0", "MeasureCPUCore1", etc.)
        local measureName = "MeasureCPUCore" .. i
        local measure = SKIN:GetMeasure(measureName)
        local value = measure:GetValue()

        -- Initialize or update the highest value and store the index
        if highestValue == nil or value > highestValue then
            highestValue = value
            fastestCoreIndex = i  -- Store the index of the fastest core
        end
    end

    return highestValue, fastestCoreIndex
end

-- Update function called by Rainmeter
function Update()
    -- Find the highest value and the index of the fastest core
    local highestValue, fastestCoreIndex = FindFastestCore()

    -- Set the Rainmeter variables without converting to string
    SKIN:Bang('!SetVariable', 'FastestCoreSpeed', highestValue)  -- Speed as a number
    SKIN:Bang('!SetVariable', 'FastestCoreIndex', fastestCoreIndex)  -- Core index as a number

    return highestValue  -- Return the fastest core speed as a number
end
