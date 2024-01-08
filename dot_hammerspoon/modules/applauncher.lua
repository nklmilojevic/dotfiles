k = hs.hotkey.modal.new({}, "F17")

pressedF18 = function()
	k.triggered = false
	k:enter()
end

releasedF18 = function()
	k:exit()
	if not k.triggered then
		hs.eventtap.keyStroke({}, "ESCAPE")
	end
end

f18 = hs.hotkey.bind({}, "F18", pressedF18, releasedF18)

launch = function(appname)
	hs.application.launchOrFocus(appname)
	k.triggered = true
end

singleapps = {
	{ "c", "Slack" },
	{ "a", "Visual Studio Code" },
	{ "b", "Bear" },
	{ "n", "Notion" },
	{ "m", "Mail" },
	{ "z", "Messages" },
	{ "f", "Brave Browser" },
	{ "i", "IntelliJ IDEA" },
	{ "r", "WezTerm" },
	{ "s", "Spotify" },
	{ "t", "Telegram" },
	{ "e", "Sublime Text" },
	{ "d", "Tidal" },
	{ "o", "NotePlan" },
}

for i, app in ipairs(singleapps) do
	k:bind({}, app[1], function()
		launch(app[2])
		k:exit()
	end)
end
