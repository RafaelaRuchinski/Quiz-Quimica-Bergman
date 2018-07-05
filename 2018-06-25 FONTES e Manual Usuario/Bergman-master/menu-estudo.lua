--  ----------------------------------------------------------------------------
--  projectname:
--  filename:     main.lua
--  description:  Contém a definição do ponto de entrada da aplicação.
--  authors:      Luiz Henrique Bosse (luizbosse99@gmail.com)
--                Juana Pedreira (juanaspedreira@gmail.com)
--                Rafaela Ruchinski (rafaelaruchi@gmail.com)
--  created:      2016-09-24
--  modified:     2018-07-02
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

local function gotoMenu()
  composer.gotoScene("menu")
end

-- Cria o grupo de controles
local function createControl(group)
  -- Cria o botão fechar
  local btnClose = display.newImageRect(group, imgSheet, sheetInfo:getFrameIndex("btnClose"), 64, 64)
  btnClose.x = display.contentCenterX
  btnClose.y = display.contentHeight - 90
  btnClose:addEventListener("tap", gotoMenu)
end

local function gotoIntroduction()
  -- Cria cena da introducao
  composer.removeScene("introducao")
  composer.gotoScene("introducao", { time=1000, effect="crossFade" })
end

local function gotoHidrocarbonetos()
  -- Cria cena sobre hidrocarbonetos
  composer.removeScene("hidrocarboneto")
  composer.gotoScene("hidrocarboneto", { time=1000, effect="crossFade" })
end

local function gotoClassificacao()
  -- Cria cena sobre classificação de hidrocarboneto
  composer.removeScene("classificacao")
  composer.gotoScene("classificacao", { time=1000, effect="crossFade" })
end


local function gotoAlcano()
  -- Cria cena sobre Alcanos
  composer.removeScene("alcano")
  composer.gotoScene("alcano", {time=1000, effect="crossFade"})
end

local function gotoAlceno()
  -- Cria cena sobre Alcenos
  composer.removeScene("alceno")
  composer.gotoScene("alceno", {time=1000, effect="crossFade"})
end

local function gotoAlcino()
  -- Cria cena sobre Alcinos
  composer.removeScene("alcino")
  composer.gotoScene("alcino", {time=1000, effect="crossFade"})
end

local function gotoReferencia()
  -- Cria cena sobre Referências
  composer.removeScene("referencia")
  composer.gotoScene("referencia", {time=1000, effect="crossFade"})
end

-- -----------------------------------------------------------------------------
-- Eventos da cena
-- -----------------------------------------------------------------------------

-- Quando a cena é criada.
function scene:create(event)
  -- Busco o grupo principal para a cena
	local sceneGroup = self.view

  -- Crio o background da cena
  local background = display.newImageRect(sceneGroup, "images/backgroundMenuEstudos.png", 1280, 720)
  background.x = display.contentCenterX
  background.y = display.contentCenterY

  local btnIntroduction = display.newText(sceneGroup, "Introdução", (display.contentWidth / 27) * 5.3, 260, native.systemFont, 60)
  btnIntroduction:setFillColor(color.preto.r, color.preto.g, color.preto.b, 0.85)
  btnIntroduction:addEventListener("tap", gotoIntroduction)

  local btnHidrocarboneto = display.newText(sceneGroup, "Hidrocarboneto", (display.contentWidth / 27) * 5.3, 360, native.systemFont, 60)
  btnHidrocarboneto:setFillColor(color.preto.r, color.preto.g, color.preto.b, 0.85)
  btnHidrocarboneto:addEventListener("tap", gotoHidrocarbonetos)

  local btnClassificacao = display.newText(sceneGroup, "Classificação", (display.contentWidth / 27) * 5.3, 460, native.systemFont, 60)
  btnClassificacao:setFillColor(color.preto.r, color.preto.g, color.preto.b, 0.85)
  btnClassificacao:addEventListener("tap", gotoClassificacao)

  local btnAlcano = display.newText(sceneGroup, "Alcano", (display.contentWidth / 7) * 5.3, 260, native.systemFont, 60)
  btnAlcano:setFillColor(color.preto.r, color.preto.g, color.preto.b, 0.85)
  btnAlcano:addEventListener("tap", gotoAlcano)

  local btnAlceno = display.newText(sceneGroup, "Alceno", (display.contentWidth / 7) * 5.3, 360, native.systemFont, 60)
  btnAlceno:setFillColor(color.preto.r, color.preto.g, color.preto.b, 0.85)
  btnAlceno:addEventListener("tap", gotoAlceno)

  local btnAlcino = display.newText(sceneGroup, "Alcino", (display.contentWidth / 7) * 5.3, 460, native.systemFont, 60)
  btnAlcino:setFillColor(color.preto.r, color.preto.g, color.preto.b, 0.85)
  btnAlcino:addEventListener("tap", gotoAlcino)

  local btnReferencia = display.newText(sceneGroup, "Referência", (display.contentWidth / 7) * 5.3, 640, native.systemFont, 60)
  btnReferencia:setFillColor(color.preto.r, color.preto.g, color.preto.b, 0.65)
  btnReferencia:addEventListener("tap", gotoReferencia)

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
