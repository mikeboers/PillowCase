from setuptools import setup
from setuptools.command.egg_info import egg_info
from setuptools.command.install_egg_info import install_egg_info
from setuptools.command.install import install

import os


def detect_installed():
    """Return (has_something, has_pillow) tuple."""
    try:
        import PIL
        return True, hasattr(PIL, 'PILLOW_VERSION')
    except ImportError:
        return False, False


def setup_pil_stub(command):
    # Run this if we have, or are likely to install pillow.
    has_something, has_pillow = detect_installed()
    if not has_something or has_pillow:
        setup(
            script_args=[command],
            name='PIL',
            version='1.1.7',
        )


class my_install(install):
    def run(self):
        install.run(self)
        setup_pil_stub('install')

class my_egg_info(egg_info):
    def run(self):
        egg_info.run(self)
        setup_pil_stub('egg_info')

class my_install_egg_info(install_egg_info):
    def run(self):
        install_egg_info.run(self)
        setup_pil_stub('install_egg_info')


has_something, has_pillow = detect_installed()

setup(
    
    name='pillowcase',
    version='2.0.0',
    description='Smooths out installation issues due to the PIL/Pillow fork.',

    url='http://github.com/mikeboers/PillowCase',
    
    # Only "require" PIL if it is already installed, otherwise we prefer Pillow.
    install_requires=['pil'] if (has_something and not has_pillow) else ['pillow'],
    
    author='Mike Boers',
    author_email='pillowcase@mikeboers.com',
    license='BSD-3',

    # Hook to install stubs for PIL.
    cmdclass={
        'install': my_install,
        'egg_info': my_egg_info,
        'install_egg_info': my_install_egg_info,
    },
    
)
