from fastapi import FastAPI, Request, HTTPException

app = FastAPI()


@app.api_route("/{path:path}", methods=["GET", "POST", "PUT", "DELETE", "PATCH"])
async def root(path: str, request: Request):
    if "x-api-key" not in request.headers:
        raise HTTPException(status_code=401, detail="Missing API key")

    return
