import requests

def pokemon_listar():

    quantidade = input("Quantos pokemons deseja listar?").strip().lower() 
    pokemons_disponiveis = "https://pokeapi.co/api/v2/pokemon?limit="+quantidade
    respostapokemons = requests.get(pokemons_disponiveis)
    dadospokemons_disponiveis = respostapokemons.json()

    for pokemon in dadospokemons_disponiveis["results"]:
        print("-",pokemon["name"])

def pokemon_buscar():

    nome = input("Qual é o pokemon?").lower().lstrip()

    url = "https://pokeapi.co/api/v2/pokemon/" + nome 

    resposta = requests.get(url)
    dados = resposta.json()

    print("status: ", resposta.status_code)
    print("--- Informações gerais---")
    print("Nome: ", dados['name'])
    print("Número: ", dados['id'])
    print("Altura: ", dados['height'])
    print("Peso: ", dados['weight'])

    print ("--- Habilidades ---")
    for item in dados["types"]:
        ("-", item["type"]["name"])

        print ("--- Stats ---")
    for stat in dados["stats"]:
        print ("-", stat["stat"]["name"],":",stat["base_stat"])

def menu():
    
    while True:
        print("\n--- MENU POKÉMON ---")
        print("1 - Listar Pokémons")
        print("2 - Buscar Pokémon")
        print("0 - Sair")

        opcao = input("Escolha uma opção: ").strip()

        if opcao == "1":
            pokemon_listar()
        elif opcao == "2":
            pokemon_buscar()
        elif opcao == "0":
            print("Saindo... Até mais!")
            break
        else:
            print("Opção inválida! Tente novamente.")

menu()
#atividade fazer função para monstrar e exibir