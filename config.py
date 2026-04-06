class Config:
    SECRET_KEY = 'your_secret_key'
    DEBUG = False

class DevelopmentConfig(Config):
    DEBUG = True
    DATABASE_URI = 'sqlite:///development.db'

class ProductionConfig(Config):
    DATABASE_URI = 'mysql://user:password@localhost/prod_db'

class TestingConfig(Config):
    TESTING = True
    DATABASE_URI = 'sqlite:///testing.db'