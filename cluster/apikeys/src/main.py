from typing import Optional
from fastapi import FastAPI, Request
from pydantic import BaseModel

app = FastAPI()


class Item(BaseModel):
    content: Optional[str] = None


@app.api_route("/{path:path}", methods=["GET", "POST", "PUT", "DELETE", "PATCH"])
async def root(path: str, request: Request, item: Optional[Item] = None):
    client_host = request.client.host
    method = request.method
    url_path = request.url.path
    query_params = dict(request.query_params)

    print(f"Client Host: {client_host}")
    print(f"HTTP Method: {method}")
    print(f"URL Path: {url_path}")
    print(f"Query Params: {query_params}")
    if item:
        print(f"Body: {item.model_dump()}")

    return {"status_code": 200, "message": "OK"}
