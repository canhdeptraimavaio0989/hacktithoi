-- Script để ẩn skin và bản đồ trong Roblox

-- Hàm để ẩn skin của nhân vật
local function hideCharacterSkins()
    local player = game.Players.LocalPlayer
    if player and player.Character then
        for _, child in pairs(player.Character:GetChildren()) do
            if child:IsA("MeshPart") or child:IsA("Accessory") then
                child.Transparency = 1
            end
        end
    end
end

-- Hàm để ẩn các phần tử trong bản đồ
local function hideMap()
    for _, part in pairs(workspace:FindFirstChildOfClass("Model"):GetChildren()) do
        if part:IsA("BasePart") or part:IsA("Model") then
            part.Transparency = 1
        end
    end
end

-- Thực hiện ẩn skin và bản đồ khi người chơi vào game
game.Players.PlayerAdded:Connect(function()
    wait(1) -- Đảm bảo các phần tử đã được tải
    hideCharacterSkins()
    hideMap()
end)

-- Thực hiện cho người chơi hiện tại
if game.Players.LocalPlayer then
    wait(1) -- Đảm bảo các phần tử đã được tải
    hideCharacterSkins()
    hideMap()
end
