# GoDot - Guia básico de criação de jogo em 3d


Série de videos em: https://www.youtube.com/watch?v=-D-IcbsdT04

(Depois vou ajustar o texto para portugues / inglês. Por agora está misturado)



## Jogo de pular entre plataformas rampa e empurrar uma bola no gol.



## Comandos básicos da engine
mousebutton3 = Rotate camera
Shift+mousebutton3 = Strafe camera
Ctrl+mousebutton3 = Zoom camera
Ctrl+k = Coment selected code block



# Parte 1
## Ciar Pisos, Paredes, Rampas e Montar o Mapa


	- Criar projeto
	- Criando PISO
		- Adicionar Nó principal: Spatial (rosa: its the most basic 3D game object, parent of all 3D related nodes.)
		- Adicionar primeiro Nó filho: MeshInstance (rosa: Instância de uma malha)
		- Seleciona o tipo de malha: New CubeMesh
		- Seleciona cor, clicando no model a direita; Material: New SpatialMaterial
			- Clica no Material: muda cor do atributo Albedo (verde como grama)
		-Gerar características StaticBody
			OU
			- Clicar na opçao: Create Convex StaticBody
			OU
			- Add Nó filho StaticBody em MeshInstance
			- Add Nó filho CollisionShape em StaticBody
		- Aperta R para mudar escala
		- Dois clicks no Nó MeshInstance: aba Transform
		- Muda a escala do Nó MeshInstance x:10, y:0.5, z:10
		- Renomeia Nó principal para Floor
		- Salva a cena: Floor.tscn

		3:16 https://www.youtube.com/watch?v=-D-IcbsdT04
	
	- Criando PAREDE
		- Nova Cena
		- Adicionar Nó principal: Spatial (rosa: its the most basic 3D game object, parent of all 3D related nodes.)
		- Renomeia Nó principal para Wall
		- Adicionar primeiro Nó filho: MeshInstance (rosa: Instância de uma malha)
		- Seleciona o tipo de malha: New CubeMesh
		- Seleciona cor, clicando no model a direita; Material: New SpatialMaterial
			- Clica no Material: muda cor do atributo Albedo (azul claro)
		-Gerar características StaticBody
			OU
			- Clicar na opçao: Create Convex StaticBody
			OU
			- Add Nó filho StaticBody em MeshInstance
			- Add Nó filho CollisionShape em StaticBody
		- Aperta R para mudar escala
		- Dois clicks no Nó MeshInstance: aba Transform
		- Muda a escala do Nó MeshInstance x:0.5, y:1, z:10
		- Salva a cena: Wall.tscn

		4:51 https://www.youtube.com/watch?v=-D-IcbsdT04

	- Criar o Mapa: Juntar PAREDES e PISOS
		- Nova Cena
		- Adiciona Node Spatial
		- Clicar no botão Link (ao lado de add Node)
		- Selecionar a cena Floor: um Node Floor aparece no centro da cena atual
		- Selecionar a cena Wall: um Node Wall aparece no centro da cena atual
		- Arraste a parede para a borda, fechando-a
		- Ctrl+D (Duplicar) o Node Wall; arrastar para a outra borda
		- Ctrl+D (Duplicar) o Node Wall; arrastar para o centro; transformar rotação: y -> 90º; arrastar para a borda;
		- Ctrl+D (Duplicar) o Node Wall; arrastar para a outra borda
		- Renomeia Node Spatial para Main
		- Salva
		- Adiciona mais um Node Floor (ao lado de Add Node); Renomeia-o para EndPlatform
		- Move-o no eixo Z (Azul) para longe do primeiro Floor
		- Levanta-o no eixo Y para fazer uma rampa entre as plataformas

			- Criando RAMPA
				- Nova Cena
				- Adicionar Nó principal: Spatial (rosa: its the most basic 3D game object, parent of all 3D related nodes.)
				- Renomeia Nó principal para Ramp
				- Adicionar primeiro Nó filho: MeshInstance (rosa: Instância de uma malha)
				- Seleciona o tipo de malha: New CubeMesh
				- Seleciona cor, clicando no model a direita; Material: New SpatialMaterial
					- Clica no Material: muda cor do atributo Albedo (verde)
				-Gerar características StaticBody
					OU
					- Clicar na opçao Mesh: Create Convex StaticBody
					OU
					- Add Nó filho StaticBody em MeshInstance
					- Add Nó filho CollisionShape em StaticBody
				- Clicar no objeto MeshInstance
				- Aperta R para mudar escala
				- Fazer um corredor; Clicar em X e esticar um pouco, clicar em Y e esticar mais
				- Salva a cena: Ramp.tscn

		- Importar a cena da Rampa para cena Main (caso a rampa caia como herança de EndPlatform: retire dragging up)
		- Apertar W para ferramentas de mover
		- Mover para o vão entre as plataformas
		- Apertar E para rotacionar e fazer a rampa
		- Salvar cena



# Parte 2
## Adicionar o Player, a bola, o gol, um objeto e mover o jogador


	Criar Player
		- Criar nova Cena
		- Adicionar Nó Root: KnematicBody
		- Adicionar Nó Fiho: MeshInstance
		- Mudar mudar o Mesh para Capsule
		- Clicar no KnematicBody novamente e criar Nó Filho: CollisionShape
		- Mudar collision body para Capsule
		- Clicar no Mesh para mudar sua cor
		- Selecionar Material: New SpatialMaterial
		- Mudar Albedo para tom amarelo
		- Clicar no Nó KnematicBody, renomear para Player
		- Salvar cena

	Adicionar Player na cena Main
		- Abrir cena Main, clicar no Linkar e selecionar a cena Player
		- Ele aparecerá no ponto 0,0,0: x,y,z
		- Rotacionar o no plano X 90º clicando em seu Transform
		- Arrastar para um ponto cima do chão

	Criar a bola
		- Criar nova Cena
		- Adicionar Nó RigidBody: Possui full interação com o mundo envolta. Mais difícil de controlar que o KnematicBody, portanto não funciona muito bem para Player, mas pode se comportar como física de objetos do mundo real
		- Adicinar MeshInstance
		- Selecionar mesh SphereMesh
		- Clicar no mesh, selecionar Material, New SpatialMaterial
		- Clicar no preview, mudar cor Albedo para rosa
		- Adicionar CollisionShape ao RigidBody
		- Selecionar o tipo collisionshape de SphereShape
		- Clicar no RigidBody, renomear para Ball
		- Salvar cena

	Adicionar Bola na cena Main
		- Selecionar EndPLatform
		- Abrir cena Main, clicar no Linkar e selecionar a cena Ball
		- Ele aparecerá no ponto 0,0,0: x,y,z de EndPlatform
		- Arrastar o Nó Ball para fora do Nó EndPlatform
		- Arrastar para um ponto acima do chão

	Criar o Gol
		- Criar nova Cena
		- Adicionar Nó Spatial
		- Adicionar MeshInstance para o nó
		- Selecionar mesh CubeMesh
		- Mudar a cor do Mesh: clicar no preview do mesh, Material, New SpatialMaterial
		- Cliar no preview, mudar cor Albedo para Púrpura
		- Selecionar o MeshInstance novamente
		- Gerar características StaticBody
			OU
			- Clicar no opçao Mesh/Malha: Create Convex StaticBody
			OU
			- Add Nó filho StaticBody em MeshInstance
			- Add Nó filho CollisionShape em StaticBody
		- Reajustar escala do Mesh em transform para as dimensões 1,6,1: xyz
		- Renomear Node Spatial para GoalPiece
		- Clicar no Mesh e apertar Ctrl+D para o duplicar e fazer a outra trave
		- Arrastar para o lado em Z
		- O Mesh já estará selecionado então é só apertar Ctrl+D para o duplicar e fazer o travessão
		- Rotacionar em transform Rotation Degree em X: 90 graus
		- Arrastar em Y para o centro dos outros dois e erguer
		- Salvar Cena


	Adicionar Gol na cena Main
		- Selecionar EndPLatform
		- Abrir cena Main, clicar no Linkar e selecionar a cena GoalPiece
		- Ele aparecerá no ponto 0,0,0: x,y,z de EndPlatform
		- Arrastar o gol para a borda de EndPlatform


	Criar objeto para detectar eventos em área (node Area)
		- Criar nova Cena
		- Adicionar node Area (precisa de CollisionShape para funcionar)
		- Adicionar MeshInstance no Area
		- Selecionar tipo CubeMesh
		- Clicar no Node Area e adicionar CollisionShape do tipo BoxShape
		- Mudar a cor do Mesh: clicar no preview do mesh, Material, New SpatialMaterial
		- Cliar no preview, mudar cor Albedo para Vermelho
		- Renomear Area para Box
		- Salvar Cena


	Adicionar Box na cena Main
		- Selecionar Floor
		- Abrir cena Main, clicar no Linkar e selecionar a cena Box
		- Ele aparecerá no ponto 0,0,0: x,y,z de Floor
		- Arras para cima do chão, fora do caminho, no canto, ao lado do pé da rampa

	Adicionar Camera a cena principal:
		- Selecionar Node Main e add Camera
		- Surgirá nas coordenadas 0,0,0
		- Posicione-a acima e atrás do player, de forma que seja possível enxergar o jogador e o cenário usando o botão Preview para checar se sua posição está correta


	Fazer o Player andar
		- Selecionar o Nó Player
		- Clicar em Adicionar Script, manter opções padrão e clicar em create
		- Criar as variáveis do player acima da função, no espaço abaixo do extends KnematicBody
		- Para criar variáveis em GoDot usa-se o comando 'var' e a identação é importante:
			var speed = 200
			var direction = Vector3() # tipo de variavel que guarda 3 valores: x,y,z
		- A função _process() é chamada a cada frame do jogo, mas usaremos a função _physics_process() em seu lugar (descomente a linha e renomeie). _physics_process() é chamada em todo frame de física do jogo, sendo melhor usá-la para lidar com objetos físicos (como KnematicBody)
		- Dentro de _physics_process() a variável direction é setada com 3 valores Zero, resetando-a a cada chamada da funçao, e será checado o Input do jogador:

			func _physics_process(delta):
				direction = Vector3(0,0,0) # vetor de direções
				if Input.is_action_pressed("ui_left"): # evento da tecla para esquerda
					direction.x -= 1 # atualização da direção
				if Input.is_action_pressed("ui_right"): # evento da tecla para direita
					direction.x += 1 # atualização da direção
				if Input.is_action_pressed("ui_up"): # evento da tecla para cima
					direction.z -= 1 # atualização da direção
				if Input.is_action_pressed("ui_down"): # evento da tecla para baixo
					direction.z += 1 # atualização da direção
		- Neste passo se faz necessário normalizar a direção para controlar a velocidade:
					direction = direction.normalized()
		- Aplica-se a velocidade sob a direção e então usa-se o método para andar deslizando até que trombe em algo, de forma que não atravesse, usando o métdodo move_and_slide():
					# delta é o tempo levado desde a ultima chamada de _physics_process
					direction = direction*speed*delta
					move_and_slide(direction, Vector3(0,1,0))
		- F6 para Rodar Cena
		- F5 para Rodar o JOGO (Selecione a Cena Main como principal e salve)




# Parte 3

## Câmera seguir o jogador, adicionar gravidade + pular ao player, Restart no Enter,rotação ao cubo e fazê-lo sumir, interação de colisão do jogador com a bola


	Fazer Camera seguir jogador
		- Arrastar node Camera fazendo-a child do node Player

	Adicionar Gravidade ao Player
		- Abrir o script do Player
		- Criar variaveis para gravidade:
			var gravity = -9.8
			var velocity = Vector3()
		- Gravidade é cumulativa, não constante.
		- Dentro da função _physics_process, ate a linha move_and_slide(), configurar e aplicar gravidade:
			velocity.y += gravity * delta
			velocity.x = direction.x
			velocity.z = direction.z
			# atribui para velocity, para tratar a gravidade cumulativa
			# permite que o player consiga subir por rampas
			velocity = move_and_slide(velocity, Vector3(0,1,0))

	Adicionar Pular ao Player
		- Abrir o script do Player
		- Após o método move_and_slide, verificar se o player está no chão e a tecla/comando para pular está pressionado, e então aplicar a força do pulo no eixo y:
			if is_on_floor() and Input.is_key_pressed(KEY_SPACE):
				velocity.y = 10

	Modificar gravidade enquanto o player está no ar (Opcional):
		- Antes da linha onde se aplica a gravidade ao eixo y de velocity, verificar se velocity.y > 0 e aplicar o valor desejado a variável gravity: 
			# trata gravidade caso o player esteja no ar (cair mais rápido)
			if velocity.y > 0:
				gravity = -20
			else:
				gravity = -30

	Mover EndPlatform e todos objetos acima dela:
		- Tornar os nós da Bola e do Gol filhos de EndPlatform, arrastando-os;
		- Colocar numa distância que o player alcance ao pular

	Adicionar Restart Game na tecla Enter
		- Adicionar script default ao Node Main
		- Na função _process() verificar o evento para verificar se a tecla Enter está apertada e caso esteja, recarregar toda a cena:
			func _process(delta):
				if Input.is_key_pressed(KEY_ENTER):
					get_tree().reload_current_scene()

	Aplicar rotação ao cubo:
		- Seleciona o node do Cubo e add script (default)
		- Na função _process() usar o metodo rotate_x(), este metodo utiliza radians ao invés de degrees, fazendo necessário o uso da função deg2rad() passando o angulo * delta, ficando assim:
			func _process(delta):
				rotate_x(deg2rad(60 * delta))
				rotate_y(deg2rad(60 * delta))

	Adicionar evento de colisao ao cubo e fazê-lo sumir:
		- Selecionar node Box
		- Clicar na aba 'Node' ao lado de 'Inspector'
		- Clicar uma vez no metodo body_enterede() e clicar em connect (canto inferior direito)
		- Selecionar o node Box na lista, com o criar o metodo automaticamente selecionado, e clicar em connect
		- O script do Box agora possui um metodo que recebe a variavel body como parâmetro, que corresponde ao objeto que entrou no Area
		- Verificar se o body é KnematicBody e caso for, dar comando para ele sumir:
			func _on_Box_body_entered(body):
				if body is KinematicBody:
					queue_free() # libera o objeto da cena

	Adicionar interação do jogador com a bola
		- É preciso detectar caso haja colisão, testar a colisão e então aplicar uma força sob a bola.
		- Clicar no script do player
		- Adicionar ao final do metodo _physics_process variavel hitCount, que vai receber as colisões do modo move_and_slide atraves do metodo get_slide_count()
		- Verificar se houve colisões no valor de hitCount;
		- Capturar na posição do vetor a colisão do modo slide com o metodo get_slide_collision() que recebe a posicao
		- Verificar se a colisão foi causada por um RigidBody e aplicar força na bola, na posição da colisão, empurrando-a na posição contrária

		var hitCount = get_slide_count()
		if hitCount > 0:
			# KnematicCollision
			var collision = get_slide_collision(0)
			if collision.collider is RigidBody:
				# apply_impulse(position, direction)
				# -direction aplica força na direção contrária
				collision.collider.apply_impulse(collision.position, -collision.normal)



# Parte 4
## Fazer interação com a bola usando Can Sleep, Massa e desaceleração da bola, configurar Gol, Adicionar Placa Yout Win, Adicionare configurar Iluminação


	Interação com RigidBody usando Can Sleep
		- Selecionar o node Ball
		- Desativar a opção Can Sleep
		- Clicar no script do Player e comentar as linhas que tratam a colisão
		- As linhas podem ser selecionadas em bloco e apertar Ctrl+K
		- A opção Can Sleep desativada possui um bug, que na primeira colisão em linha reta a bola não reage
		- Eu preferi deixar as linhas de colisãoe junto da opção Can Sleep desativada

	Modificar Massa e desaceleração/atrito da Bola
		- Slecionar Node Ball
		- Modificar o atributo Mass para modificar massa
		- Atribuir valor 30 para teste
		- Ir a aba Linear e Angular
		- Modificar o valor de Damp para desaceleração
		- Linear para quando ela se move para alguma direção
		- Angular para quando ela está rodando
		- Atribuir valor 0.8 para teste

	Configurar Area do Gol
		- É preciso criar uma Area dentro do gol para interação
		- Selecionar EndPlatform
		- Adicionar node Area
		- Ela surgirá no centro de EndPlatform
		- É preciso adicionar CollisionShape ao node Area
		- Clicar nela e Add child node CollisionShape
		- Selecionar o tipo New BoxShape
		- Apertar W e arrastar a Area para o centro do Gol, na borda da plataforma
		- Apertar R e redimensionar a Area no tamanho do portal

	Tratar evento body_enterede() da Area
		- Selecionar o objeto Area
		- Clicar em Node ao lado da aba Inspector
		- Clicar em body_enterede, escolher o node Main e clicar em Connect
		- Um metodo será automaticamente adicionado ao script de Main
		- O metodo recebe como parametro a variavel body, a qual deve ser testada e exibir uma saída
			func _on_Area_body_entered(body):
				if body is RigidBody:
					print("win")

	Adicionar Texto gráfico dizendo que o jogador venceu
		- Clicar no Main
		- Ao invés de usar um node em 3d, será usado um node em 2d
		- Selecionar Node Panel. A
		- Redimensionar o node 2d e centralizar na cena
		- Adicionar child node Label ao Panel
		- Modificar atributo do Label para "You Win!" (aba Inspector) apertar Enter
		- F5 testar

	Programar placa You Win
		- Selecionar script do node Main
		- Reprogramar o metodo _ready()
		- Na linguagem gotod o $ (cifrão) é usado para acessar os nodes por seus nomes
		- No metodo _ready() é dado o comando para esconder o Panel
			func _ready():
				$Panel.hide()
		- No metodo _on_Area_body_entered(), por sua vez, é dado o comando para mostrar o Panel
			func _on_Area_body_entered(body):
				if body is RigidBody:
					$Panel.show()

	Adicionar Iluminação
		- Clicar no Node Main e Add Node DirecitonalLight
		- Surgirá no centro da cena Main
		- W para mover para cima
		- Q para rotacionar apontando para baixo e rotacionar para a direita (dar aspecto natural)
		- Habilitar sombra, no menu Inspector selecionar Shadow e Ativar
		- Modificar intensidade da luz no menu Inspector na opção Energy (0.75 parece bom)

