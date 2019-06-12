-- menuScene

local composer = require( "composer" )
local widget = require("widget")
 
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
local function showGameScene()
    local options = {
        effect = "fade",
        time = 500
    }
    composer.gotoScene( "game" , options )
end 
 
 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        
        --Cosmetics such as the background and title
        local background = display.newRect(display.contentCenterX, display.contentCenterY, 1000, 1000)
        background:setFillColor( 0/255,255/255,0/255 )
        sceneGroup:insert( background )

        local title = display.newText("What's your name?", display.contentWidth / 2, display.contentHeight / 2, native.systemFont, 30)
        title:setFillColor( 0,0,0 )
        sceneGroup:insert( title )

        --Textbox where the user enters their name
        nameFieldTextField = native.newTextField( display.contentCenterX, display.contentCenterY + 65, 225, 40 )
        nameFieldTextField.id = "nameTextField" 

        --Button that enters the user's name to a table and starts the game
        local button = widget.newButton
        {
            label = " Start",
            fontSize = 30,
            -- Properties for a rounded rectangle button
            shape = "roundedRect",
            width = 300,
            height = 50,
            cornerRadius = 2,
            fillColor = { default={1,1,1,1}, over={1,0.1,0.7,0.4} },
            strokeColor = { default={1,0.4,0,1}, over={0.8,0.8,1,1} },
            strokeWidth = 4,
            onEvent = function (event)
                if event.phase == "ended" then
                    composer.gotoScene("game")
                end
            end
        }
        button.x = display.contentWidth / 2
        button.y = display.contentHeight / 2 - 100
        sceneGroup:insert(button)

        --Hides the name textfield
        function scene:hide(event)

        if nameFieldTextField then
            nameFieldTextField :removeSelf()
            nameFieldTextField = nil
        end
end
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
 
    end
end

function scene:destroy( event )
 
    local sceneGroup = self.view
    

end
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
--scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
--scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
scene:addEventListener( "hide", scene )
-- -----------------------------------------------------------------------------------
 
return scene