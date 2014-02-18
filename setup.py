from setuptools import setup, find_packages
setup(
    name = 'pony-homepage',
    version = '0.1.0',
    packages = find_packages(),
    scripts = ['manage.py'],

    install_requires = ['Django==1.6.2', 'django-pony==1.0'],

    # metadata for upload to PyPI
    author = 'Eduard Iskandarov',
    author_email = 'e.iskandarov@corp.mail.ru',
    description = 'Pony Homepage',
    long_description = 'AWESOME application for every pony',
    license = 'BSD',
    keywords = 'django pony rpm spec virtualenv rpm',
    url = 'http://pypi.example.com/pypi/pony-homepage/',
)
