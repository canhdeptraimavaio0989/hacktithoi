-- Script để ẩn skin của nhân vật và bản đồ

-- Hàm để ẩn skin của nhân vật
local function hideCharacterSkins(character)
    for _, child in pairs(character:GetChildren()) do
        -- Kiểm tra xem đối tượng có phải là MeshPart không
        if child:IsA("MeshPart") then
            child.Transparency = 1 -- Đặt độ trong suốt thành 1
        elseif child:IsA("Accessory") then
            child.Handle.Transparency = 1 -- Đặt độ trong suốt cho Handle của phụ kiện
        end
    end
end

-- Hàm để ẩn các phần tử trong bản đồ
local function hideMap()
    for _, child in pairs(workspace:GetChildren()) do
        -- Kiểm tra xem đối tượng có phải là Model hoặc BasePart không
        if child:IsA("Model") or child:IsA("BasePart") then
            child.Transparency = 1 -- Đặt độ trong suốt thành 1
            child.CanCollide = false -- Ngăn không cho va chạm
        end
    end
end

-- Xử lý khi người chơi mới vào game
game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        wait(1) -- Đợi để đảm bảo nhân vật đã được tải
        hideCharacterSkins(character) -- Ẩn skin của nhân vật
    end)
end)

-- Ẩn bản đồ ngay lập tức cho người chơi hiện tại
hideMap()

-- Ẩn skin cho người chơi hiện tại nếu nhân vật đã tồn tại
for _, player in pairs(game.Players:GetPlayers()) do
    if player.Character then
        hideCharacterSkins(player.Character)
    end
end
