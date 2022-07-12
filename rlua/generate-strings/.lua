-- Generates a random string (Utilizes the UTF-8 Basic Latin character set [https://www.w3schools.com/charsets/ref_utf_basic_latin.asp])
-- complex#0002 (900187302016471092)

local Generate = {}

function ReturnCharSet(Start, End, ExtraValues)
    local Table = {}
    for i = Start, End do
        table.insert(Table, utf8.char(i))
    end
    if ExtraValues then
        for _, Value in ipairs(ExtraValues) do
            table.insert(Table, Value)
        end
    end
    return Table
end

Generate.Letters = function(Length)
    local CharacterSet = ReturnCharSet(65, 90, ReturnCharSet(97, 122))
    local String = ""
    repeat
        String = String .. CharacterSet[Random.new():NextInteger(1, #CharacterSet)]
    until string.len(String) == Length
    return String
end

Generate.Numbers = function(Length)
    local CharacterSet = ReturnCharSet(48, 57)
    local String = ""
    repeat
        String = String .. CharacterSet[Random.new():NextInteger(1, #CharacterSet)]
    until string.len(String) == Length
    return String
end

Generate.Characters = function(Length)
    local CharacterSet = ReturnCharSet(65, 90, ReturnCharSet(97, 122, ReturnCharSet(48, 57)))
    local String = ""
    repeat
        String = String .. CharacterSet[Random.new():NextInteger(1, #CharacterSet)]
    until string.len(String) == Length
    return String
end

Generate.Symbols = function(Length, PunctuationIncluded)
    local CharacterSet = ReturnCharSet(32, 47, ReturnCharSet(58, 64, ReturnCharSet(91, 96, ReturnCharSet(123, 126))))
    local PunctuationSet = {".", ",", "?", ";", "!", ":", "'", "(", ")", "[", "]", '"', "-", "/", "@", "{", "}", "*"}
    local String = ""
    if PunctuationIncluded then
        repeat
            String = String .. CharacterSet[Random.new():NextInteger(1, #CharacterSet)]
        until string.len(String) == Length
    else
        repeat
            local CharacterToAdd = CharacterSet[Random.new():NextInteger(1, #CharacterSet)]
            if table.find(PunctuationSet, CharacterToAdd) then
                continue
            else
                String = String .. CharacterToAdd
            end
        until string.len(String) == Length
    end
    return String
end

Generate.AllCharacters = function(Length)
    local CharacterSet = ReturnCharSet(32, 126)
    local String = ""
    repeat
        String = String .. CharacterSet[Random.new():NextInteger(1, #CharacterSet)]
    until string.len(String) == Length
    return String
end

return Generate
