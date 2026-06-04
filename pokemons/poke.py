import requests

url = "https://pokeapi.co/api/v2/pokemon/pikachu"

resposta = requests.get(url)

print("status: ", resposta.status_code)

dados = resposta.json()

print("Nome: ", dados['name'])
print("Número: ", dados['id'])
print("Altura: ", dados['height'])
print("Peso: ", dados['weight'])