#!/bin/bash

composer install
php bin/console cache:warmup

apache2-foreground
