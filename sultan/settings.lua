require(localPath .. "dialog")
require(localPath .. "utils")
require(localPath .. "palace")
require(localPath .. "gadalka")
require(localPath .. "bonuses")
require(localPath .. "sultanObjects")
require(localPath .. "ministery")
require(localPath .. "academy")
require(localPath .. "harem")
require(localPath .. "arena")
require(localPath .. "walking")
require(localPath .. "gifts")
require(localPath .. "gunAndWheel")
require(localPath .. "changeAcc")
require(localPath .. "rgmt")
require(localPath .. "getStars")

version = "1.0"

screenX = screen:getX()
screenY = screen:getY()

print("Размер экрана x ", screenX, "y ", screenY)
Settings:setCompareDimension(true, screenX)
Settings:setScriptDimension(true, screenX)        -- Если разрешение экрана

-- Минимальный уровень совпадения изображений
Settings:set("MinSimilarity", 0.70)
-- Ручной уровень совпадения для функций
CustomSumilar = 0.9
CustomTimeToIdentify = 0.1
-- Задание пути к картинкам

imagePath = (localPath .. "image/")
setImmersiveMode(true)
autoGameArea(false)
-- Настройка dragDrop
setDragDropStepCount(300)
setDragDropTiming(150, 250)


pCenter = Location(screenX / 2, screenY / 2)
Point_1 = Location(screenX / 2, screenY / 2)
Point_2 = Location(screenX / 2 + 200, screenY / 2)
Point_3 = Location(screenX / 2 + 300, screenY / 2)
Point_4 = Location(screenX / 2, screenY / 2 + screenY / 4)
topCenterPoint = Location(screenX / 2, screenY * 0.07)

RegScreen = Region(0, 0, screenX, screenY)
RegHalfUp = Region(0, 0, screenX, screenY / 2)
RegMiddle = Region(0, screenY / 4, screenX, screenY / 2)
RegRightLine = Region(screenX - screenX / 4, 0, screenX / 4, 2 * screenY / 3)
RegHalftRight = Region(screenX - screenX / 2, 0, screenX / 2, screenY)
RegQuaterRight = Region(screenX - screenX / 4, 0, screenX / 4, screenY)
RegRight = Region(screenX - screenX / 6, 0, screenX / 6, screenY)
RegQuaterUp = Region(0, 0, screenX, screenY / 2 - screenY / 4)
RegHalfBottom = Region(0, screenY / 2, screenX, screenY)
RegQuaterBottom = Region(0, screenY / 2 + screenY / 4, screenX, screenY / 4)
RegBack = Region(0, 0, screenX / 4, screenY / 4)

