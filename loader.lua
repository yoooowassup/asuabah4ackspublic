local PlaceId = 1458767429;

pcall(function()
  queue_on_teleport([[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/yoooowassup/asuabah4ackspublic/refs/heads/main/loader.lua"))()
  ]])
end)

if game.PlaceId ~= PlaceId then return; end;
loadstring(game:HttpGet("https://raw.githubusercontent.com/yoooowassup/asuabah4ackspublic/refs/heads/main/main.lua"))()
