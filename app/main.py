from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def root():
    return {"message": "TrackWorkout backend is running!"}
