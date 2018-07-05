--  ----------------------------------------------------------------------------
--  projectname:
--  filename:     main.lua
--  description:  Contém a definição do ponto de entrada da aplicação.
--  authors:      Luiz Henrique Bosse (luizbosse99@gmail.com)
--                Juana Pedreira (juanaspedreira@gmail.com)
--                Rafaela Ruchinski (rafaelaruchi@gmail.com)
--  created:      2016-09-24
--  modified:     2018-07-05
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
local shop
local sheetInfo = require("spritesheet")
local imgShop = graphics.newImageSheet("images/shop.png", sheetInfo:getSheet())
local imgEstudant = graphics.newImageSheet("images/estudant.png", sheetInfo:getSheet())

local txtMoney

-- -----------------------------------------------------------------------------
-- Métodos e escopo principal da cena
-- -----------------------------------------------------------------------------
-- Seto ps parâmetros iniciais
composer.setVariable("money", 0)

local function shop()
  -- Cria cena do shop

end

-- Cria o botão do shop
local function createButtonShop(group)
  -- Cria o botão do shop
  local btnShop = display.newImageRect(group, imgShop, sheetInfo:getFrameIndex("shop"), 200, 200)
  btnShop.x = display.contentWidth - 250
  btnShop.y = display.contentHeight - 50
  btnShop:addEventListener("tap", shop)
end

local function gotoEstudant()
  -- Cria cena do estudant
  composer.removeScene("menu-estudo")
  composer.gotoScene("menu-estudo", { time=1000, effect="crossFade" })
end

-- Cria o botão do shop
local function createButtonInformation(group)
  -- Cria o botão do shop
  local btnEstudant = display.newImageRect(group, imgEstudant, sheetInfo:getFrameIndex("estudant"), 100, 100)
  btnEstudant.x = display.contentWidth - 800
  btnEstudant.y = display.contentHeight - 150
  btnEstudant:addEventListener("tap", gotoEstudant)

  local btnEstudantText = display.newText(group, "Área de Estudo", display.contentWidth - 560, display.contentHeight - 160, native.systemFont, 55)
  btnEstudantText:setFillColor(color.preto.r, color.preto.g, color.preto.b, 0.85)
  btnEstudantText:addEventListener("tap", gotoEstudant)
end

local function gotoConquista()
  composer.gotoScene("conquista", {time=1000, effect="crossFade"})
end

local function createButtonConquista(group)
  -- Cria o botão do shop
  local btnConquista = display.newImageRect(group, "images/conquistas.png", 100, 100)
  btnConquista.x = display.contentWidth - 1000
  btnConquista.y = display.contentHeight - 80
  btnConquista:addEventListener("tap", gotoConquista)
end

-- Leva o usuário até a cena do Jogo
local function gotoGame()
  composer.removeScene("game")
	composer.gotoScene("game", { time=1000, effect="crossFade" })
end

-- Leva o usuário até a cena de pontuação
local function gotoHighScores()
  composer.removeScene("highscores")
	composer.gotoScene("highscores", { time=1000, effect="crossFade" })
end

-- Leva o usuário até a cena de créditos
local function gotoCredits()
  composer.gotoScene("credits", { time=1000, effect="crossFade" })
end

-- -----------------------------------------------------------------------------
-- Eventos da cena
-- -----------------------------------------------------------------------------

-- Quando a cena é criada.
function scene:create(event)
  -- Busco o grupo principal para a cena
	local sceneGroup = self.view

  -- Crio o background da cena
  local background = display.newImageRect(sceneGroup, "images/backgroundMenu.png", 1280, 720)
  background.x = display.contentCenterX
  background.y = display.contentCenterY

  -- Crio o texto para informações sobre moedas
  txtMoney = display.newText(sceneGroup, composer.getVariable("money"), 55, 55, native.systemFont, 44)
  txtMoney.anchorX = 0
  txtMoney:setFillColor(color.vermelho.r, color.vermelho.g, color.vermelho.b)

  -- Crio as opções do menu
  local btnPlay = display.newText(sceneGroup, "Novo Jogo", (display.contentWidth / 10) * 5.3, 270, native.systemFont, 60)
  btnPlay:setFillColor(color.preto.r, color.preto.g, color.preto.b, 0.85)
  btnPlay:addEventListener("tap", gotoGame)

  local btnHighScores = display.newText(sceneGroup, "Recordes", (display.contentWidth / 10) * 5.3, 370, native.systemFont, 60)
  btnHighScores:setFillColor(color.preto.r, color.preto.g, color.preto.b, 0.85)
  btnHighScores:addEventListener("tap", gotoHighScores)

  local btnCredits = display.newText(sceneGroup, "Créditos", (display.contentWidth / 10) * 5.3, 470, native.systemFont, 60)
  btnCredits:setFillColor(color.preto.r, color.preto.g, color.preto.b, 0.85)
  btnCredits:addEventListener("tap", gotoCredits)

  -- Crio um grupo para o shop adiciono ao grupo da cena
  gamerGroup = display.newGroup()
  sceneGroup:insert(gamerGroup)

  -- Crio o shop
  createButtonShop(gamerGroup)

  -- Cria botão de estudos
  createButtonInformation(gamerGroup)
	
  -- Cria botão de conquista
  createButtonConquista(gamerGroup)
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

-- Atualiza os textos de pontuação, munição e vidas
local function updateText()
  txtMoney.text = composer.getVariable("money")
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
