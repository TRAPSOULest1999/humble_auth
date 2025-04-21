# Flutter Login & Authentication WebApp

This is a secure full-stack application built with Flutter (frontend) and FastAPI + MySQL (backend). It demonstrates user registration, login, token-based authentication, and user profile management.

## Table of Contents
- [Technology Stack](#technology-stack)
- [Setup Instructions](#setup-instructions)
- [Running the Application](#running-the-application)
- [API Endpoints](#api-endpoints)
- [Querying the Database](#querying-the-database)
- [Implementation Details](#implementation-details)
- [Future Work](#future-work)

---

## Technology Stack

- **Frontend:** Flutter Web
- **Backend:** Python 3.11, FastAPI
- **Database:** MySQL (hosted on Railway)
- **ORM:** SQLAlchemy
- **Security:** JWT (with Expiry), Bcrypt (password hashing)
- **Token Management:** `shared_preferences` for Flutter

---

## Setup Instructions

### Backend (FastAPI)

1. Clone the repo and navigate to `backend/`
2. Create a virtual environment:
   ```bash
   python -m venv venv
   source venv/bin/activate  # or venv\Scripts\activate on Windows
   ```
3. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```
4. Create a `.env` file:
   ```env
   DATABASE_URL=mysql+pymysql://<username>:<password>@<host>:<port>/<database>
   SECRET_KEY=your-secret-key
   ALGORITHM=HS256
   ACCESS_TOKEN_EXPIRE_MINUTES=30
   ```
5. Start the API:
   ```bash
   uvicorn app.main:app --reload
   ```

### Frontend (Flutter Web)

1. Install Flutter SDK and web dependencies
2. Navigate to `frontend/`
3. Get dependencies:
   ```bash
   flutter pub get
   ```
4. Clean and build:
   ```bash
   flutter clean
   flutter build web
   flutter run -d chrome
   ```

---

## Running the Application

- Ensure the backend is running at `http://localhost:8000`
- Run the Flutter app with Chrome (`flutter run -d chrome`)
- Use the Login/Register form
- After login/register, you will be redirected to the HomePage
- HomePage allows you to update first and last name and logout

---

## API Endpoints

### Authentication
- `POST /auth/register` - Register new user
- `POST /auth/login` - Login existing user

### User Management
- `PATCH /user/update` - Update user details (requires Bearer token)
- `GET /user/{email}` - Fetch user details by email (public for test purposes)

---

## Querying the Database (Railway or MySQL CLI)

To get all users:
```sql
SELECT * FROM users;
```

To get a specific user by email:
```sql
SELECT * FROM users WHERE email = 'user@example.com';
```

You can also query using the GET endpoint:
```http
GET http://localhost:8000/user/user@example.com
```

Response:
```json
{
  "id": 1,
  "email": "user@example.com",
  "first_name": "John",
  "last_name": "Doe",
  "updated_at": "2025-04-21T14:00:00"
}
```

---

## Implementation Details

- LoginForm handles both login and registration based on a toggle state
- JWT token is securely stored using `shared_preferences`
- The backend uses Pydantic schemas to control exposed data
- Passwords are stored as bcrypt hashes
- Frontend communicates with the backend via HTTP requests using the `http` package
- Only the token is stored locally for authentication
- Routes are modular and follow SOLID principles (e.g. `auth_routes`, `user_routes`, `auth_service`, `user_service`)
- Clean separation between model, schema, logic, and route layers

---

## Future Work

- Implement unit and integration tests for both frontend and backend
- Add a `/auth/me` endpoint to get current user from JWT
- Extend user registration to accept first/last name
- Add Docker support for backend deployment
- Use `provider` or `riverpod` for Flutter state management
- Add loading overlays and error-specific modals
- Enhance security by restricting `GET /user/{email}` to token holders only
- CI/CD integration (GitHub Actions, Railway or Render deployment pipeline)

---

This implementation demonstrates clean architecture, API-first thinking, and secure practices aligned with enterprise-grade development expectations.