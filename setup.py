from setuptools import setup
import os

try:
    import PIL
except ImportError:
    PIL = None


has_pil = bool(PIL or os.environ.get('PILLOWCASE_REGISTER'))


setup(
    
    name='pillowcase' if has_pil else 'PIL',
    version='1.1.8',
    description='A stub that satisfies PIL==1.1.7 and stops PIL from fighting with Pillow',

    url='http://github.com/mikeboers/PillowCase',
    
    install_requires=[] if has_pil else ['pillow'],
    provides=['PIL (1.1.7)'],
    
    author='Mike Boers',
    author_email='pillowcase@mikeboers.com',
    license='BSD-3',
    
)
