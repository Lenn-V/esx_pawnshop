function SendToWebhook(title, message, color)
    if not Config.Webhook or Config.Webhook == '' then return end

    local embed = {
        {
            title = title,
            description = message,
            color = color or 5763719,
            footer = {
                text = os.date('%d-%m-%Y %H:%M:%S')
            }
        }
    }

    PerformHttpRequest(Config.Webhook, function() end, 'POST', json.encode({
        username = TranslateCap('webhook_username'),
        embeds = embed
    }), { ['Content-Type'] = 'application/json' })
end