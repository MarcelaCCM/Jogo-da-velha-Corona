-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

--Tabuleiro--

local text = display.newText( "Jogo da Velha", 165, 30, native.systemFont, 20)
text:setFillColor(1,0,0)

tabuleiro = {
    {" "," "," "},
    {" "," "," "},
    {" "," "," "}
}

   ---Botao Novo--
   
botaoNovoJogo = display.newRect(160, 450, 150, 40)
botaoNovoJogo:setFillColor(1, 1, 1)
local texto = display.newText( "Novo", 165, 450, native.systemFont, 20)
texto:setTextColor(1, 0, 0)

function botaoNovoJogo:touch(event)
    if event.phase == "began" then
	
	
        zerarTabuleiro()
        display.remove(texto)
        jogador = "X"
		texto = ""
        iniciarJogo()
        return true
    end
end
botaoNovoJogo:addEventListener("touch", botaoNovoJogo)

--Verifica quem ta jogando--

function jogadorDaVez()
    if (jogador == "X") then
        jogador = "O"
    else
        jogador = "X"
    end

end

--Iniciar uma novo jogo--

function iniciarJogo()
    montarTabuleiro()
    criarBotao()
    funcaoDoBotao()

end

function verificarJogo()
    if (vencedor()) then
        if (texto == "") then
            texto = display.newText("O jogador "..jogador.." venceu!", 170, 400, native.systemFont, 20)
            texto:setFillColor(1,0,0)
        end
    elseif (empate()) then
        texto = display.newText("Empate", 170, 400, native.systemFont, 18)
        texto:setFillColor(1,0,0)
    else
        jogadorDaVez()
    end
end

--Verifica se todos elementos de uma linha, coluna e diagonas sao iguais.
function vencedor()
	for i = 1, 3 do
		--verificar linhas
		if (((tabuleiro[i][1] == tabuleiro[i][2]) and (tabuleiro[i][3] == tabuleiro[i][1])) and (tabuleiro[i][2] ~= " ")) then
			return true
		end

		--verificar colunas
		if (((tabuleiro[1][i] == tabuleiro[2][i]) and (tabuleiro[3][i] == tabuleiro[2][i])) and (tabuleiro[2][i] ~= " ")) then
			return true
		end

	end

	--verificar diagonais da esquerda para direita
    if (((tabuleiro[1][1] == tabuleiro[2][2]) and (tabuleiro[3][3] == tabuleiro[2][2])) and (tabuleiro[2][2] ~= " " )) then
        return true
    end

    --verificar diagonais da direita para esquerda
    if (((tabuleiro[1][3] == tabuleiro[2][2]) and (tabuleiro[3][1] == tabuleiro[2][2])) and (tabuleiro[2][2] ~= " " )) then
		return true
	end

	return false
end

--Verifica se nao houve ganhador e caso o elemento da linha ou da coluna for igual, ele retorna verdadeiro
function empate()
	for i = 1, 3, 1 do
		for j = 1, 3, 1 do
			if (tabuleiro[i][j] == " ") then
				return false
			end

		end

	end

	return true

end

--Limpar tabuleiro
function zerarTabuleiro()
    for i = 1, 3, 1 do
        for j = 1, 3, 1 do
            tabuleiro[i][j] = " "
        end

    end

end

--Verifica se a jogada e valida, caso jogue em mesmo posicao sera pedido que jogue novamento.
function realizarJogada(posicao, simbolo)
	if ((posicao == 1) and tabuleiro[1][1] == " ") then
        desenhar11(simbolo)
        verificarJogo()
	elseif ((posicao == 2) and tabuleiro[1][2] == " ") then
        desenhar12(simbolo)
        verificarJogo()
	elseif ((posicao == 3) and tabuleiro[1][3] == " ") then
        desenhar13(simbolo)
        verificarJogo()
	elseif ((posicao == 4) and tabuleiro[2][1] == " ") then
        desenhar21(simbolo)
        verificarJogo()
	elseif ((posicao == 5) and tabuleiro[2][2] == " ") then
        desenhar22(simbolo)
        verificarJogo()
	elseif ((posicao == 6) and tabuleiro[2][3] == " ") then
        desenhar23(simbolo)
        verificarJogo()
	elseif ((posicao == 7) and tabuleiro[3][1] == " ") then
        desenhar31(simbolo)
        verificarJogo()
	elseif ((posicao == 8) and tabuleiro[3][2] == " ") then
        desenhar32(simbolo)
        verificarJogo()
	elseif ((posicao == 9) and tabuleiro[3][3] == " ") then
        desenhar33(simbolo)
        verificarJogo()
	else
		return false
	end

	--Retorna verdadeiro se o tabuleiro receber um simbolo
	return true

end

--Contrucao do tabueiro
function montarTabuleiro()

	local linha1= display.newLine(270,155,35,155)
	local linha2= display.newLine(270,270,35,270)

	local coluna1= display.newLine(115,60,115,370)
	local coluna2= display.newLine(200,60,200,370)
	
end

--Criar botoes
function criarBotao() 
	 botao1= display.newRect (76,100,75,104)
		botao1:setFillColor(0,0,0)
		
	botao2= display.newRect (158,100,76,103)
		botao2:setFillColor(0,0,0)
		
	 botao3= display.newRect (237,100,72,105)
		botao3:setFillColor(0,0,0)
		
	botao4 = display.newRect (75,213,76,109)
		botao4:setFillColor(0,0,0)
		
	botao5= display.newRect (158,213,77,108)
		botao5:setFillColor(0,0,0)
		
	 botao6= display.newRect (237,213,72,110)
		botao6:setFillColor(0,0,0)
		
	 botao7 = display.newRect (75,328,78,108)
		botao7:setFillColor(0,0,0)
		
	botao8= display.newRect (158,328,79,109)
		botao8:setFillColor(0,0,0)	
		
	botao9= display.newRect (238,328,70,109)
		botao9:setFillColor(0,0,0)
		

end

--Funcao dos Botoes

function funcaoDoBotao()

	function botao1:touch(event)
		if event.phase == "began" then
			realizarJogada(1, jogador)
			return true
		end
		
	end

	function botao2:touch(event)
		if event.phase == "began" then
			realizarJogada(2, jogador)
			return true
		end
		
	end

	function botao3:touch(event)
		if event.phase == "began" then
			realizarJogada(3, jogador)
			return true
		end
		
	end

	function botao4:touch(event)
		if event.phase == "began" then
			realizarJogada(4, jogador)
			return true
		end
		
	end

	function botao5:touch(event)
		if event.phase == "began" then
			realizarJogada(5, jogador)
			return true
		end
		
	end

	function botao6:touch(event)
		if event.phase == "began" then
			realizarJogada(6, jogador)
			return true
		end
		
	end

	function botao7:touch(event)
		if event.phase == "began" then
			realizarJogada(7, jogador)
			return true
		end
		
	end

	function botao8:touch(event)
		if event.phase == "began" then
			realizarJogada(8, jogador)
			return true
		end
		
	end

	function botao9:touch(event)
		if event.phase == "began" then
			realizarJogada(9, jogador)
			return true
		end
		
    end

	botao1:addEventListener("touch", botao1)
	botao2:addEventListener("touch", botao2)
	botao3:addEventListener("touch", botao3)
	botao4:addEventListener("touch", botao4)
	botao5:addEventListener("touch", botao5)
	botao6:addEventListener("touch", botao6)
	botao7:addEventListener("touch", botao7)
	botao8:addEventListener("touch", botao8)
    botao9:addEventListener("touch", botao9)
end

--função desenha o elemento

function desenhar11(simbolo)
	tabuleiro[1][1] = simbolo

    if simbolo == "X" then
	
		x= display.newLine(55,50,110,145)
		y=display.newLine(110,50,55,145)

        x.strokeWidth =5
        y.strokeWidth =5

		x:setStrokeColor(1,0,0)
		y:setStrokeColor(1,0,0)
	else
		x= display.newCircle(80,100,30)
		x:setStrokeColor(1,0,0)
		x.strokeWidth =5
		x:setFillColor (0)
    end
end

function desenhar12(simbolo)
	tabuleiro[1][2] = simbolo

    if simbolo == "X" then
	
	x= display.newLine(130,50,190,145)
		y=display.newLine(190,50,130,145)

        x.strokeWidth =5
        y.strokeWidth =5

		x:setStrokeColor(1,0,0)
		y:setStrokeColor(1,0,0)
       
	else
	
		x= display.newCircle(160,100,30)
		x:setStrokeColor(1,0,0)
		x.strokeWidth =5
		x:setFillColor (0)
		
    end
end

function desenhar13(simbolo)
	tabuleiro[1][3] = simbolo

    if simbolo == "X" then
	
	x= display.newLine(265,50,206,145)
		y=display.newLine(206,50,265,145)

        x.strokeWidth =5
        y.strokeWidth =5

		x:setStrokeColor(1,0,0)
		y:setStrokeColor(1,0,0)
       
    else
		x= display.newCircle(240,100,30)
		x:setStrokeColor(1,0,0)
		x.strokeWidth =5
		x:setFillColor (0)
	end
end

function desenhar21(simbolo)
	tabuleiro[2][1] = simbolo

    if simbolo == "X" then
       x= display.newLine(55,160,110,265)
		y=display.newLine(110,160,55,265)

        x.strokeWidth =5
        y.strokeWidth =5

		x:setStrokeColor(1,0,0)
		y:setStrokeColor(1,0,0)
	else
	
		x= display.newCircle(80,210,30)
		x:setStrokeColor(1,0,0)
		x.strokeWidth =5
		x:setFillColor (0)
		
    end
end

function desenhar22(simbolo)
	tabuleiro[2][2] = simbolo

    if simbolo == "X" then
	
	x= display.newLine(130,160,190,265)
		y=display.newLine(190,160,130,265)

        x.strokeWidth =5
        y.strokeWidth =5	
		
		x:setStrokeColor(1,0,0)
		y:setStrokeColor(1,0,0)
       
	else
	
	x= display.newCircle(160,210,30)
		x:setStrokeColor(1,0,0)
		x.strokeWidth =5
		x:setFillColor (0)
		
    end
end

function desenhar23(simbolo)
	tabuleiro[2][3] = simbolo

    if simbolo == "X" then
        x= display.newLine(265,160,206,265)
		y=display.newLine(206,160,265,265)

        x.strokeWidth =5
        y.strokeWidth =5

		x:setStrokeColor(1,0,0)
		y:setStrokeColor(1,0,0)
	else
		x= display.newCircle(240,210,30)
		x:setStrokeColor(1,0,0)
		x.strokeWidth =5
		x:setFillColor (0)
    end
end

function desenhar31(simbolo)
	tabuleiro[3][1] = simbolo

    if simbolo == "X" then
       	x= display.newLine(55,275,110,380)
		y=display.newLine(110,275,55,380)

        x.strokeWidth =5
        y.strokeWidth =5

    x:setStrokeColor(1,0,0)
    y:setStrokeColor(1,0,0)
        
	else
	
	x= display.newCircle(80,330,30)
		x:setStrokeColor(1,0,0)
		x.strokeWidth =5
		x:setFillColor (0)
		
    end
end

function desenhar32(simbolo)
	tabuleiro[3][2] = simbolo

    if simbolo == "X" then
       x= display.newLine(130,275,190,380)
		y=display.newLine(190,275,130,380)
		
        x.strokeWidth =5
        y.strokeWidth =5
		
		x:setStrokeColor(1,0,0)
		y:setStrokeColor(1,0,0)
	else
		x= display.newCircle(160,330,30)
		x:setStrokeColor(1,0,0)
		x.strokeWidth =5
		x:setFillColor (0)
    end
end

function desenhar33(simbolo)
	tabuleiro[3][3] = simbolo

    if simbolo == "X" then
        x= display.newLine(265,275,206,380)
		y=display.newLine(206,275,265,380)
	
        x.strokeWidth =5
        y.strokeWidth =5

		x:setStrokeColor(1,0,0)
		y:setStrokeColor(1,0,0)
	else
		x= display.newCircle(240,330,30)
		x:setStrokeColor(1,0,0)
		x.strokeWidth =5
		x:setFillColor (0)
		
    end
end

iniciarJogo()
	

