---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Sphehr.
--- DateTime: 11.01.2020 22:27
---
localPath = scriptPath()
require(localPath .. "utils")
require(localPath .. "dialog")
require(localPath .. "sultanObjects")
require(localPath .. "color")
require(localPath .. "arenalvl")

function findFrames()

    local vizirFrames = findAll(vizirFrame)
    local region = {}
    for i, image in ipairs(vizirFrames) do
        local xX = image:getX()
        local yY = image:getY()
        local xW = image:getW()
        region[i] = Region(xX + xW / 6, yY + xW / 6, xW / 4, 2 * xW / 3)
       --findColors(region[i])
    end
    if (#region == 3 ) then
        vizirFramesDetected = true
        return region
    end
end


function findMinLevel()
    if not(vizirFramesDetected) then
        vizirRegion = findFrames()
    end
    local firstVizirLevel = findVizirLvl(vizirRegion[1])
    minVizir = 1
    if (firstVizirLevel == 1) then
        click(vizirRegion[1])
        return
    end
    toast(firstVizirLevel)
    wait(0.1)
    local secondVizirLevel = findVizirLvl(vizirRegion[2])
    if (secondVizirLevel == 1) then
        click(vizirRegion[2])
        return
    elseif(secondVizirLevel <= firstVizirLevel) then
        if (secondVizirLevel == firstVizirLevel) then
            minVizir = rnd(1,2)
        else
            minVizir = 2
        end
    end
    toast(secondVizirLevel)
    wait(0.1)
    local thirdVizirLevel = findVizirLvl(vizirRegion[3])
    if (thirdVizirLevel == 1) then
        click(vizirRegion[3])
        return
    elseif(thirdVizirLevel <= firstVizirLevel and thirdVizirLevel <= secondVizirLevel) then
        if (thirdVizirLevel == firstVizirLevel and thirdVizirLevel == secondVizirLevel) then
            minVizir = rnd(1,3)
        elseif (thirdVizirLevel == secondVizirLevel) then
            minVizir = rnd(2,3)
        else
            minVizir = 3
        end
    end
    toast (firstVizirLevel .. " " .. secondVizirLevel .. " " .. thirdVizirLevel )
    click(vizirRegion[minVizir])

end


function chooselvl2()

    while (not (findImage(vizirFrame, RegHalfUp))) do
        wait(0.5)
    end
    snapshotColor()
    findMinLevel()
    usePreviousSnap(false)
end

function chooseLvl()

    --existsMultiMax({ lvl1, lvl2, lvl3, lvl4, lvl5, lvl6, lvl7, lvl8 }, RegHalfUp)
    snapshotColor()
    toast("done snap")

    if (customExists(lvl2, RegHalfUp)) then
        local r1, g1, c1 = getColor(getLastMatch())
        toast("lvl 2 " .. r1 .. " " .. g1 .. " " .. c1)
    elseif (customExists(lvl3, RegHalfUp)) then
        local r1, g1, c1 = getColor(getLastMatch())
        toast("lvl 3 " .. r1 .. " " .. g1 .. " " .. c1)
    elseif (customExists(lvl4, RegHalfUp)) then
        local r1, g1, c1 = getColor(getLastMatch())
        toast("lvl 4 " .. r1 .. " " .. g1 .. " " .. c1)
    elseif (customExists(lvl5, RegHalfUp)) then
        local r1, g1, c1 = getColor(getLastMatch())
        toast("lvl 5 " .. r1 .. " " .. g1 .. " " .. c1)
    elseif (customExists(lvl6, RegHalfUp)) then
        toast("lvl6!")
        img, center = findImage(lvl6, RegHalfUp)
        local r1, g1, c1 = getColor(img) --//94 35 6
        toast("lvl 6 " .. r1 .. " " .. g1 .. " " .. c1)
    elseif (customExists(lvl7, RegHalfUp)) then
        local r1, g1, c1 = getColor(getLastMatch())
        toast("lvl 7 " .. r1 .. " " .. g1 .. " " .. c1)
    elseif (customExists(lvl8, RegHalfUp)) then
        local r1, g1, c1 = getColor(getLastMatch())
        toast("lvl 8 " .. r1 .. " " .. g1 .. " " .. c1)
    elseif (customExists(lvl1, RegHalfUp)) then
        toast("shouldBellvl1")
        local r1, g1, c1 = getColor(getLastMatch())
        toast("lvl 1 " .. r1 .. " " .. g1 .. " " .. c1)
    else
        toast("not found")
    end

    --  existsClickFullSimilarity(lvl3, RegHalfUp, 0.1)
    usePreviousSnap(false)
    --    score1 = getLastMatch():getScore()
    --    center1 = getLastMatch():getCenter()
    --    findImageFullSimilarity(lvl8, RegHalfUp, 0.1)
    --    score2 = getLastMatch():getScore()
    --    center2 = getLastMatch():getCenter()
    --    if (score1 > score2) then
    --        click(center1)
    --    end
    --elseif () then
    --elseif (existsClickFullSimilarity(lvl4, RegHalfUp, 0.1)) then
    --elseif (findImageFullSimilarity(lvl5, RegHalfUp, 0.1)) then
    --    score1 = getLastMatch():getScore()
    --    center1 = getLastMatch():getCenter()
    --    findImageFullSimilarity(lvl7, RegHalfUp, 0.1)
    --    score2 = getLastMatch():getScore()
    --    center2 = getLastMatch():getCenter()
    --    if (score1 > score2) then
    --        click(center1)
    --    end
    --elseif (existsClickFullSimilarity(lvl6, RegHalfUp, 0.1)) then
    --elseif (existsClickFullSimilarity(lvl7, RegHalfUp, 0.1)) then
    --elseif (existsClickFullSimilarity(lvl8, RegHalfUp, 0.1)) then
    --end
    --usePreviousSnap(false)
end

function cancelPoints()
    if (findImage(approveNoPoints, RegMiddle)) then
        existsClick(closeBonus, RegMiddle, 0.1)
        wait(0.1)
        existsClick(closeBonus, RegMiddle, 0.1)
    end
end

sX = 0
sY = 0

function goToNextVizir()
    doneClick = false

    waitExistAndClick(nextVizir, RegQuaterBottom, 0.1)
    while (not (doneClick)) do
        snapshot()
        if (not (findImage(arenaBonus, RegMiddle)
                or findImage(fightScreen, RegHalfBottom)
                or findImage(boxText, RegScreen)
                or findImage(fight, RegMiddle))) then
            clickScreenCenter()
            wait(0.1)
        else
            doneClick = true
        end
        usePreviousSnap(false)
    end
    F_log("done arenaBonus or boxText")
    if (findImage(boxText, RegHalfBottom)) then
        im1, c = findImage(boxText, RegHalfBottom)
        xx1 = im1:getX()
        yy1 = im1:getY()

        click(Location(xx1, yy1 - (yy1 - screenY / 2) / 2))
        while (existsClick(boxText2, RegHalfUp, 0.1)) do
        end
    end
end

function fighting()
    if (not (isContinueFight)) then
        setImagePath(localPath .. "image")
        while (not (findImage(arena, RegHalfBottom))) do
            dragDrop(Point_1, Point_2)
        end
        if (getNotCollectedReg(arena, RegHalfBottom)) then
            wait(1)
        end
    else
        setImagePath(localPath .. "image" .. arenaPath)
        if (isAutoFight) then
            if (existsClick(autoFight, RegQuaterBottom, 0.1)) then
                --- автобой
                if (twoP) then
                    existsClick(points2, RegScreen, 0.1)
                elseif (oneP) then
                    existsClick(points1, RegScreen, 0.1)
                else
                    existsClick(withoutBonus, RegHallfBottom, 0.1)
                end
                click(Location(screenX / 2, screenY / 2))
            end
        else
            --- без автобоя
            chooselvl2()
            timeout = 0
            while (not (existsClick(approveNoPoints, RegMiddle, 0.1)) and timeout < 0.5) do
                wait(0.1)
                timeout = timeout + 0.1
            end
            goToNextVizir()
            isPointsOff = false
            while not (findImage(fight, RegMiddle)) do
                if (pointsIdx == 0) then
                    if (not (isPointsOff)) then
                        if (not findImage(arenaBonus, RegHalfUp)) then
                            isPointsOff = true
                        end
                    end
                    while (not (isPointsOff) and not (existsClick(turnOff, RegHalfBottom, 0.1))) do
                        wait(0.1)
                    end
                    if (not (isPointsOff)) then
                        existsClick(closeBonus, RegHalfUp, 0.1)
                        isPointsOff = true
                    end
                    chooselvl2()
                    goToNextVizir()
                else
                    if (pointsIdx == 2) then
                        while (not (existsClick(points2, RegScreen, 0.1))) do
                            wait(0.1)
                        end
                        cancelPoints()
                    elseif (pointsIdx == 1) then
                        F_log("one point waiting")
                        while (not (existsClick(points1, RegScreen, 0.1))) do
                            wait(0.1)
                        end
                        cancelPoints()
                    end
                    chooselvl2()
                    goToNextVizir()
                end
            end
        end
    end
    -- backTo(arena)
end