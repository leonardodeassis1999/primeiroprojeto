from fastapi import FastAPI 
app = FastAPI()

@app.get("/")
def leitura_rota():
    return {"mensagem": "primeira rota rodando"}

@app.get("/sobre")
def sobre():
    return {"Curso":"Jovem Programador"},{"Leonardo":"27 anos"}

@app.get("/sobre/{nome}")
def sobre_personalizado(nome:str):
    return {"mensagem": f"ola {nome}"}