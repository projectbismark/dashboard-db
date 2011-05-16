#!/bin/sh

python manage.py inspectdb | sed s/unique=True/primary_key=True/ > summary/models.py 
