from fastapi.middleware.cors import CORSMiddleware
from fastapi import FastAPI
from .database import engine
from .models import Base
from .routes import auth_routes
from .routes import user_routes


app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # or specify your frontend origin
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Create tables
Base.metadata.create_all(bind=engine)

# Activate auth_route
app.include_router(auth_routes.router)

# Activate user updates route
app.include_router(user_routes.router)