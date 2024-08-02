-- Script để ẩn skin của nhân vật và đổi màu bản đồ thành màu xám

-- Hàm để ẩn skin của nhân vật
local function hideCharacterSkins(character)
    for _, child in pairs(character:GetChildren()) do
        -- Kiểm tra xem đối tượng có phải là MeshPart không
        if child:IsA("MeshPart") then
            child.Transparency = 1 -- Đặt độ trong suốt thành 1
        elseif child:IsA("Accessory") then
            local handle = child:FindFirstChild("Handle")
            if handle then
                handle.Transparency = 1 -- Đặt độ trong suốt cho Handle của phụ kiện
            end
        end
    end
end

-- Hàm để đổi màu bản đồ thành xám
local function grayOutMap()
    for _, child in pairs(workspace:GetChildren()) do
        -- Kiểm tra xem đối tượng có phải là Model hoặc BasePart không
        if child:IsA("Model") or child:IsA("BasePart") then
            child.Color = Color3.new(0.5, 0.5, 0.5) -- Đặt màu thành xám
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

-- Đổi màu ngay lập tức cho bản đồ hiện tại
grayOutMap()

-- Ẩn skin cho người chơi hiện tại nếu nhân vật đã tồn tại
for _, player in pairs(game.Players:GetPlayers()) do
    if player.Character then
        hideCharacterSkins(player.Character)
    end
end
