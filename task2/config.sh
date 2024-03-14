#!/usr/bin/bash

ulimit -c unlimited^C
sudo sysctl -w kernel.core_pattern=./core.%e.%p.%t

#Update intervals
declare intervals=5

#Alert Thresholds
declare thresholds=90
