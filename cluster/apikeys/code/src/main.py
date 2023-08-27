from fastapi import FastAPI, Request, HTTPException
import os

app = FastAPI()

API_KEYS = set(os.environ["API_KEYS"].split(","))


@app.api_route("/{path:path}", methods=["GET", "POST", "PUT", "DELETE", "PATCH"])
async def root(path: str, request: Request):
    if "x-api-key" not in request.headers:
        raise HTTPException(status_code=401, detail="Missing API key")

    if request.headers["x-api-key"] not in API_KEYS:
        raise HTTPException(status_code=401, detail="Invalid API key")

    return
