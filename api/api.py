from fastapi import FastAPI

app = FastAPI(title="A Simple API App")


@app.get("/health")
def health_check():
    return {"status": "ok"}


@app.get("/items")
def get_items():
    return [
        {"id": 1, "name": "Laptop", "price": 999.99},
        {"id": 2, "name": "Keyboard", "price": 79.99},
        {"id": 3, "name": "Mouse", "price": 29.99},
    ]