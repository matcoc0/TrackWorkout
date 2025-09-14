from fastapi import FastAPI
app = FastAPI(title="Fitness Tracker API")
#test
@app.get("/")
def read_root():
    return {"message": "Bienvenue sur l'API Fitness Tracker!"}
