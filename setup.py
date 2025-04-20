#!/usr/bin/env python
from setuptools import setup, find_packages

setup(
    name="devtoroman",
    version="1.0.0",
    description="Devnagri to Roman",
    author="Your Name",
    author_email="your.email@example.com",
    packages=find_packages(),
    entry_points={
        'console_scripts': [
            'devtoroman=devtoroman:main',
        ],
    },
    install_requires=[
        # List your dependencies here
    ],
)

