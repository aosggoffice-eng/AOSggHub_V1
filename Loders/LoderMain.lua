-- ตาราง Map ID -> Script URL
local mapScripts = {
    [8737899170] = "https://raw.githubusercontent.com/aosggoffice-eng/AOSggHub_V1/refs/heads/main/Pet%20sim99%20fastegg",
    [1234567890] = "https://example.com/script1.lua",
    [9876543210] = "https://example.com/script2.lua"
}

local placeId = game.PlaceId
local scriptURL = mapScripts[placeId]

if scriptURL then
    print("แมพตรง กำลังรันสคริปต์...")
    
    local success, err = pcall(function()
        loadstring(game:HttpGet(scriptURL))()
    end)

    if not success then
        warn("รันสคริปต์ไม่สำเร็จ:", err)
    end
else
    -- เตะผู้เล่นถ้าไม่รองรับ
    game.Players.LocalPlayer:Kick("สคริปไม่รองรับแมพนี้")
end
