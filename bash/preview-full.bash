#!/bin/bash

bundle exec rake integrate;
bundle exec rake generate;
bundle exec rake preview;
