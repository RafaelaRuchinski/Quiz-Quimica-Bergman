--  ----------------------------------------------------------------------------
--  projectname:
--  filename:     main.lua
--  description:  Contém a definição do ponto de entrada da aplicação.
--  authors:      Luiz Henrique Bosse (luizbosse99@gmail.com)
--                Juana Pedreira (juanaspedreira@gmail.com)
--                Rafaela Ruchinski (rafaelaruchi@gmail.com)
--  created:      2018-05-03
--  modified:     2018-05-10
--  ----------------------------------------------------------------------------

-- -----------------------------------------------------------------------------
-- Configuração inicial para a cena
-- -----------------------------------------------------------------------------

-- Carrego o Composer para tratar as cenas da aplicação
local composer = require("composer")

-- Crio uma nova cena
local scene = composer.newScene()

-- -----------------------------------------------------------------------------
-- Variáveis da cena
-- -----------------------------------------------------------------------------
local gamerGroup
local sheetInfo = require("spritesheet")
local imgSheet = graphics.newImageSheet("images/spritesheet.png", sheetInfo:getSheet())

-- -----------------------------------------------------------------------------
-- Métodos e escopo principal da cena
-- -----------------------------------------------------------------------------

local function gotoMenuEstudo()
  composer.gotoScene("menu-estudo")
end

-- Cria o grupo de controles
local function createControl(group)
  -- Cria o botão fechar
  local btnClose = display.newImageRect(group, imgSheet, sheetInfo:getFrameIndex("btnClose"), 64, 64)
  btnClose.x = display.contentCenterX
  btnClose.y = display.contentHeight - 90
  btnClose:addEventListener("tap", gotoMenuEstudo)
end


-- -----------------------------------------------------------------------------
-- Eventos da cena
-- -----------------------------------------------------------------------------

-- Quando a cena é criada.
function scene:create(event)
  -- Busco o grupo principal para a cena
	local sceneGroup = self.view

  -- Crio o background da cena
  local background = display.newImageRect(sceneGroup, "images/introducao.png", 1280, 720)
  background.x = display.contentCenterX
  background.y = display.contentCenterY

  -- Crio um grupo para o shop adiciono ao grupo da cena
  gamerGroup = display.newGroup()
  sceneGroup:insert(gamerGroup)

  createControl(gamerGroup)
end

-- Quando a cena está pronta para ser mostrada (phase will) e quando é mostrada (phase did).
function scene:show(event)
	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then

	elseif ( phase == "did" ) then

	end
end

-- Quando a cena está prestes a ser escondida (phase will) e assim que é escondida (phase did).
function scene:hide(event)
	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then

	elseif ( phase == "did" ) then

	end
end

-- Quando a cena é destruida
function scene:destroy(event)
	local sceneGroup = self.view
end

-- -----------------------------------------------------------------------------
-- Adicionando os escutadores à cena
-- -----------------------------------------------------------------------------
scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)
-- -----------------------------------------------------------------------------

-- Retorno a cena
return scene
