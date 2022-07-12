-- Synapse X Console functions
-- complex#0002 (900187302016471092)
-- Console colors: [LINK]

function rconsolestructure(MessageColor, Type, TypeColor)
    rconsoleprint("@@" .. MessageColor:gsub(" ", "_"):upper() .. "@@")
    rconsoleprint("[")
    rconsoleprint("@@" .. TypeColor:gsub(" ", "_"):upper() .. "@@")
    rconsoleprint(Type:upper())
    rconsoleprint("@@" .. MessageColor:gsub(" ", "_"):upper() .. "@@")
    rconsoleprint("]: ")
end

getgenv().print = function(Message)
    rconsolestructure("white", "info", "light blue")
    rconsoleprint(Message .. "\n")
end

getgenv().warn = function(Message)
    rconsolestructure("white", "warn", "yellow")
    rconsoleprint(Message .. "\n")
end

getgenv().error = function(Message)
    rconsolestructure("white", "Error", "light red")
    rconsoleprint(Message .. "\n")
end
