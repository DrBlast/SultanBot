---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by DrBlast.
--- DateTime: 20.01.2020 0:49
---

localPath = scriptPath()
require(localPath .. "utils")
require(localPath .. "dialog")
require(localPath .. "sultanObjects")

function collectHeirs()
    if (existsClick(heir, RegScreen, 0.1)) then
        if (findImage(addHeir, RegHalfBottom)) then
            usePreviousSnap(true)
            img, ic = findImage(addHeir, RegHalfBottom)
            usePreviousSnap(false)
            x = ic:getX()
            y = ic:getY()
            xc = img:getX()
            rad = x - xc
           -- print("rad ".. rad)
            h = 7 * rad / 2 - 10
          --  print("h ".. h)
            hx = 0
            cnt = math.floor(xc / h)
          --  print(cnt)
            for i = 1, cnt do
                hx = hx + h
                print("hx ".. hx)
                click(Location(hx, y))
                wait(0.1)
                while (existsClick(learn, RegHalfBottom, 0.1)) do
                    wait(0.1)
                end
            end
            existsClick(xx2, RegScreen, 0.1)
        else
            existsClick(learnAll, RegHalfBottom, 0.1)
        end
       backTo(heir)
    end

end

function vizitPartners()

    autovisit = false
    if (findImage(autoVisit, RegQuaterBottom)) then

        autovisit = true
        usePreviousSnap(true)
        existsClick(autoVisit, RegQuaterBottom, 0.1)
        usePreviousSnap(false)
        while (not(findImage(closeBtn,RegQuaterBottom))) do
            wait(0.1)
        end
        usePreviousSnap(true)
        existsClick(closeBtn, RegQuaterBottom, 0.1)
        usePreviousSnap(false)
    else
        while (not (findImage(renew, RegQuaterBottom))) do
            click(Location(x, y))
            wait(0.1)
        end
    end
    if (not(autovisit) and isPuzzle) then
        while (not (findImage(newMoves, RegMiddle))) do
            click(Location(x, y))
        end
        usePreviousSnap(true)
        waitExistAndClick(newMoves, RegMiddle, 0.1)
        usePreviousSnap(false)
        while (not (findImage(renew, RegQuaterBottom))) do
            click(Location(x, y))
            wait(0.1)
        end
    end
end

function collectHarem(isCollectHeirs)
    i = 0
    while (not (findImage(harem, RegHalfUp))) do
        dragDrop(Point_1, Point_2)
        i = i + 1
        if (i == 10) then
            return
        end
    end
    click(image_Center)
    wait(0.2)
    setImagePath(localPath .. "image" .. haremPath)
    if (isCollectHeirs) then
        collectHeirs()
    end
    existsClick(consort, RegHalfBottom, 0.1)
    x = screenX * 0.84
    y = screenY * 0.948
    vizitPartners()
    setImagePath(localPath .. "image")
    existsClick(xx2, RegScreen, 0.1)
    wait(1)
    backTo(harem)
end