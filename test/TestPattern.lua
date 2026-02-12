-- ===============================
-- TestPattern.lua
-- ===============================

local BASE_SCREEN_WIDTH = 1080
local TEST_IMAGE = "test.png"

setImmersiveMode(true)
autoGameArea(true)
setImagePath(scriptPath())
Settings:setScriptDimension(true, BASE_SCREEN_WIDTH)
Settings:setCompareDimension(true, BASE_SCREEN_WIDTH)

local MIN_SIMILARITY = 0.75
local MAX_SIMILARITY = 0.95
local SIM_STEP = 0.02

function testTemplate()
    for sim = MAX_SIMILARITY, MIN_SIMILARITY, -SIM_STEP do
        local p = Pattern(TEST_IMAGE):similar(sim)
        if exists(p) then
            toast("Найдено! Similarity: " .. string.format("%.2f", sim))
            print("Найдено! Similarity: " .. string.format("%.2f", sim))
            return true
        end
    end
    return false
end

local found = false

-- 1
if testTemplate() then
    print("Mode: immersive=true, autoGameArea=true")
    found = true
end

-- 2
if not found then
    setImmersiveMode(false)
    autoGameArea(true)
    if testTemplate() then
        print("Mode: immersive=false, autoGameArea=true")
        found = true
    end
end

-- 3
if not found then
    setImmersiveMode(false)
    autoGameArea(false)
    if testTemplate() then
        print("Mode: immersive=false, autoGameArea=false")
        found = true
    end
end

-- 4
if not found then
    setImmersiveMode(true)
    autoGameArea(false)
    if testTemplate() then
        print("Mode: immersive=true, autoGameArea=false")
        found = true
    end
end

-- Финальный вывод
if not found then
    toast("Совпадений не найдено")
    print("Совпадений не найдено")
end
