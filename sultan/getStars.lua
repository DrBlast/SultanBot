---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Sphehr.
--- DateTime: 23.01.2020 0:24
---
localPath = scriptPath()
require(localPath .. "utils")
require(localPath .. "dialog")
require(localPath .. "color")
require(localPath .. "sultanObjects")

Star = {}
--тело класса
function Star:new(region, name, center)

    -- свойства
    local obj = {}
    obj.region = region
    obj.name = name
    obj.center = center

    setmetatable(obj, self)
    self.__index = self;
    return obj
end

function inTable(tbl, reg, exclude)
    for key, value in pairs(tbl) do
        if (reg:exists(Pattern(value.name):similar(0.7)) and exclude ~= key) then
            return key
        end
    end
    return -1
end

pointsNum = 10
function waitUntilChanged(xX, yC, step, points)

    local similar = true

    log("while not changed")
    while (similar) do
        local i = 0
        snapshotColor()
        for l = 1, pointsNum do
            local tr, tg, tb = getColor(Location(xX + step * l, yC))
            local point = tr + tg + tb
            log(tr .. " " .. tg .. " " .. tb .. "? " .. point .." == " .. points[l])
            if (points[l] ~= point) then
                i = i + 1
            else
                log("break")
                break
            end
        end
        usePreviousSnap(false)
        if (i >= pointsNum - 2) then
            similar = false
        else
            wait(0.1)
        end
    end
    log("done cycle")

end

function collectStars()
    local points = {}
    local step = 0
    repeat
        local all = {}
        j = 1
        local allStars = findAll(stars1)
        Settings:snapSet("OutputCaptureImg", true)
        k = 0
        for i, im in ipairs(allStars) do
            local xX = im:getX()
            local yY = im:getY()
            local xW = im:getW()
            local yH = im:getH()
            click(im:getCenter())
            k = k + 1
            wait(0.6)
            --
            snapshot()
            ss = Star:new(Region(xX + 10, yY + 10, xW - 10, yH - 10), "s" .. i .. ".png", im:getCenter())
            ss.region:save(ss.name)
            if (k == 1 or k % 2 == 0) then
                j = j + 1
                all[j] = ss
            else
                local key = inTable(all, ss.region, 0)
                if (key > 0) then
                    click(all[key].center)
                    wait(1.5)
                    k = k - 1
                elseif (key < 0) then
                    j = j + 1
                    all[j] = ss
                end
            end
            wait(1.5)
            usePreviousSnap(false)
        end

        while (findImage(stars1, RegScreen)) do
            usePreviousSnap(true)
            local im = findImage(stars1, RegScreen)
            usePreviousSnap(false)
            local xX = im:getX()
            local yY = im:getY()
            local xW = im:getW()
            local yH = im:getH()
            click(im:getCenter())
            wait(2)
            r = Region(xX + 10, yY + 10, xW - 10, yH - 10)
            r:save("00.png")
            usePreviousSnap(true)
            local key = inTable(all, r, 0)
            if (key > 0) then
                click(all[key].center)
                wait(1)
                local key2 = inTable(all, Region(xX + 10, yY + 10, xW - 10, yH - 10), key)
                if (key2 > 0) then
                    click(all[key2].center)
                    wait(1)
                end
            end
            usePreviousSnap(false)
        end

    until not (existsClick(oneMore, RegScreen, 0.5))

end
