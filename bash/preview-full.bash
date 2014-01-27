#!/bin/bash
set -e;
bundle exec rake integrate;
bundle exec rake generate;
bundle exec rake preview;
