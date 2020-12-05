localPath = scriptPath()
require(localPath .. "settings")

showDlgRus(false)

if (immersiveMode) then
    setImmersiveMode(true)
else
    setImmersiveMode(false)
end

if (isContinueFight) then
    fighting()
elseif (isRgmt) then
    guardRgmt()
elseif (stars) then
    collectStars()
else
    if (isPuzzle) then
        collectGunAndWheel()
    end
    if (isGadalka) then
        collectGadalka()
        wait(1)
    end
    if (isMinistery) then
        getMinisters()
        wait(1)
    end
    if (isAcademy) then
        collectAcademy()
        wait(1)
    end
    collectPalaceGoods()
    wait(1)
    if (isHarem) then
        collectHarem(isCollectHeirs)
        wait(1)
    end
    collectBonuses()
    if (isWalking) then
        goForAWalk()
    end
    if (isPuzzle) then
        oneFight()
    end
    wait(1)
    collectGifts()
end
