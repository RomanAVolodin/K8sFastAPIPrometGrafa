import logging

import uvicorn
from fastapi import FastAPI
from prometheus_fastapi_instrumentator import Instrumentator

from api.v1.posts import router
from core.logger import LOGGING
from core.settings import settings
from db.db import create_database

app = FastAPI(
    title=settings.project_name,
    description=settings.project_description,
    version='1.0.0',
    docs_url='/api/openapi',
    openapi_url='/api/openapi.json',
)


@app.on_event('startup')
async def startup():
    if settings.debug_mode:
        from models.post import Post  # noqa: F401

        await create_database()


app.include_router(router, prefix='/api/v1/posts')

if __name__ == '__main__':
    uvicorn.run(
        'main:app', host='0.0.0.0', port=settings.app_port, log_config=LOGGING, log_level=logging.DEBUG, reload=True,
    )
