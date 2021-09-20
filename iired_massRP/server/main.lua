
-- command

RegisterCommand('iired', function(source, args, rawCommand)
    local _source = source
    TriggerEvent("vorp:getCharacter", _source, function(user)
        local group = user.group
        if group == 'admin' then
		TriggerClientEvent('lto_iiredmenu:open', _source)
        end
    end)
end)
