from pydantic import BaseModel, EmailStr
from typing import Optional
from datetime import datetime

# Shared base model (for inheritance if needed)
class UserBase(BaseModel):
    email: EmailStr
    first_name: Optional[str] = None
    last_name: Optional[str] = None

# Used on signup/update → no password exposed
class UserOut(UserBase):
    id: int
    updated_at: datetime

model_config = {
    "from_attributes": True
} # Enables conversion from SQLAlchemy model

# For login
class UserLogin(BaseModel):
    email: EmailStr
    password: str

# For PATCH /user/update
class UserUpdate(BaseModel):
    first_name: Optional[str]
    last_name: Optional[str]

# For token response
class Token(BaseModel):
    access_token: str
    token_type: str = "bearer"

# For extracting data from token (e.g. email)
class TokenData(BaseModel):
    email: Optional[str] = None
