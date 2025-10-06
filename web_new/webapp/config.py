import os
from glob import glob


class Config(object):
    # Overwrite env vars with a secret if available
    for var in glob('/run/secrets/*'):
        k = var.split('/')[-1].upper()
        v = open(var).read().rstrip('\n')
        os.environ[k] = v
        # print(f'export {k}={v}')

    SECRET_KEY = os.getenv('FLASK_SECRET_KEY')
    STATIC_FOLDER = os.getenv('STATIC_FOLDER', '/static')
    DEBUG = os.getenv('DEBUG', False)
    JWT_SECRET_KEY = os.getenv('JWT_SECRET_KEY')
    JWT_IDENTITY_CLAIM = 'sub'
