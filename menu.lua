local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
local function gotoGame ()
	composer.gotoScene ("game", {time=800, effect="crossFade"})
end

local function gotoRecordes ()
	composer.gotoScene ("recordes", {time=800, effect="crossFade"})
end

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen

	local bg = display.newImageRect (sceneGroup, "imagens/bg.png", 800,1400)
	bg.x = display.contentCenterX
	bg.y = display.contentCenterY

	local titulo = display.newImageRect (sceneGroup, "imagens/title.png", 500, 80)
	titulo.x = display.contentCenterX
	titulo.y = 200

	local botaoPlay = display.newText (sceneGroup, "Play", display.contentCenterX, 700, Arial, 44 )
	botaoPlay:setFillColor (0.82, 0.86, 1)

	local botaoRecordes = display.newText (sceneGroup, "Recordes", display.contentCenterX, 810, Arial, 44 )
	botaoRecordes:setFillColor (0.75, 0.78, 1)

	botaoPlay:addEventListener ("tap", gotoGame)
	botaoRecordes:addEventListener ("tap", gotoRecordes)

	somMenu = audio.loadStream("audio/Midnight-Crawlers_Looping.wav")
 	
end

-- show()
function scene:show( event )
	audio.play(somMenu, {channel=2, loops=-1})
	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)

	elseif ( phase == "did" ) then
		-- Code here runs when the scene is entirely on screen
	end
end


-- hide()
function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is on screen (but is about to go off screen)

	elseif ( phase == "did" ) then
		-- Code here runs immediately after the scene goes entirely off screen
	audio.stop(2)
	end
end


-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view
	-- Code here runs prior to the removal of scene's view
	audio.dispose(somMenu)
end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene