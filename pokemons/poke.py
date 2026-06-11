import requests

nome = input("Qual é o pokemon?").lower().lstrip()

url = "https://pokeapi.co/api/v2/pokemon/" + nome 

resposta = requests.get(url)

print("status: ", resposta.status_code)

dados = resposta.json()

print("--- Informações gerais---")
print("Nome: ", dados['name'])
print("Número: ", dados['id'])
print("Altura: ", dados['height'])
print("Peso: ", dados['weight'])

print ("--- Habilidades ---")
for item in dados["types"]:
    print("-", item["type"]["name"])

print ("--- Stats ---")
for stat in dados["stats"]:
    print ("-", stat["stat"]["name"],":",stat["base_stat"])

#atividade fazer função para monstrar e exibir