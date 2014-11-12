---
layout: post
title: "atop quick start: an introduction to atop snapshotting"
date: 2014-11-12 12:35:43 +0000
comments: true
author: kenneth
categories: 
tags: 
 - sysadmin
 - atop
 - servermanagement
 - sysadmin
description: A howto on using atop
---

[`atop`](http://www.atoptool.nl/) is a server diagnostic tool to take snapshots of the server's activity at specified intervals, so it's useful for debugging intermitttent issues without watching the server constantly.

`atop` is available to install from the repos with a `yum install atop` or `apt-get install` atop depending if you're on a RedHat or Debian-based server. By default atop will take snapshots every 10 minutes.

Omnce it's been left running, you can view its snapshots by running `atop -r /var/log/atop/atop_<date>` - you can see the dates that are logged by listing the `/var/log/atop` directory.

Two key commands to use are `b` and `t`. Pressing `b` will prompt for a time in the format hh:mm. Enter a time and it'll jump to the nearest snapshot. From there `t` and `T` (`shift-t`) will jump you forwards and backwards through the logs respectively

This is an example of atop's output:

```

ATOP - ip-10-0-1-22                                                          2014/11/11  00:30:02                                                          -----------                                                           10m0s elapsed
PRC | sys    5.11s  | user  10.94s |               |              | #proc    104  | #trun      1 |               | #tslpi   149 |  #tslpu     0 |              |  #zombie    0 | clones    37 |               |              |  #exit     46 |
CPU | sys	1%  | user	2% |               | irq       0% |               | idle    197% |               | wait      0% |               |              |  steal     0% | guest     0% |  curf 2.50GHz |              |  curscal   ?% |
cpu | sys	1%  | user	1% |               | irq       0% |               | idle     98% |               | cpu001 w  0% |               |              |  steal     0% | guest     0% |  curf 2.50GHz |              |  curscal   ?% |
cpu | sys	0%  | user	0% |               | irq       0% |               | idle     99% |               | cpu000 w  0% |               |              |  steal     0% | guest     0% |  curf 2.50GHz |              |  curscal   ?% |
CPL | avg1    0.14  |              | avg5    0.09  |              | avg15   0.07  |              |               | csw   261923 |               | intr  279857 |               |              |               | numcpu     2 |               |
MEM | tot     7.3G  | free    5.8G | cache 176.1M  | dirty   0.8M | buff   14.2M  | slab   41.4M | slrec  20.1M  | shmem  36.9M |  shrss   0.0M | shswp   0.0M |               | vmbal   0.0M |               | hptot   0.0M |  hpuse   0.0M |
SWP | tot     0.0M  | free    0.0M |               |              |               |              |               |              |               |              |               |              |  vmcom   2.1G | vmlim   3.6G |               |
NET | transport     | tcpi   69012 | tcpo   74002  |              | udpi      93  | udpo      97 | tcpao     72  | tcppo    330 |               | tcprs    250 |  tcpie      0 | tcpor     24 |  udpnp      0 |              |  udpie	   0 |
NET | network       | ipi    69105 |               | ipo    74025 | ipfrw      0  |              | deliv  69105  |              |               |              |               |              |  icmpi      0 | icmpo	   0 |               |
NET | eth0    ----  | pcki   68732 |               | pcko   73654 | si  342 Kbps  | so  464 Kbps |               | coll       0 |  mlti       0 |              |  erri       0 | erro       0 |  drpi       0 |              |  drpo	   0 |
NET | lo      ----  | pcki     396 |               | pcko     396 | si   17 Kbps  | so   17 Kbps |               | coll       0 |  mlti       0 |              |  erri       0 | erro       0 |  drpi       0 |              |  drpo	   0 |
Window resized to 238x71...
  PID          TID         RUID             EUID              THR         SYSCPU         USRCPU          VGROW          RGROW          RDDSK          WRDSK         ST         EXC         S         CPUNR          CPU         CMD        1/3
 1335            -         root             root                7          2.51s          2.97s             0K             0K             0K             0K         --           -         S             1           1%         glusterfs
17247            -         apache           apache              1          0.40s          4.34s         46644K         66352K          3340K          3292K         --           -         S             1           1%         httpd
17274            -         apache           apache              1          0.36s          1.13s         35236K         54628K          1188K          2304K         --           -         S             0           0%         httpd
17267            -         apache           apache              1          0.24s          0.94s         55204K         83040K          2348K          2760K         --           -         S             1           0%         httpd
17310            -         apache           apache              1          0.26s          0.49s         961.9M         83508K           548K            12K         N-           -         S             1           0%         httpd
16708            -         varnish          varnish            19          0.28s          0.08s          4992K          5188K         32588K           448K         --           -         S             0           0%         varnishd
17248            -         apache           apache              1          0.11s          0.17s          7128K         24120K           364K          1788K         --           -         S             1           0%         httpd
17187            -         root             root                1          0.18s          0.04s           140K           140K             0K            24K         --           -         R             1           0%         atop
 1418            -         root             root                7          0.11s          0.10s             0K             0K             0K             0K         --           -         S             1           0%         glusterfs
17309            -         apache           apache              1          0.06s          0.10s         922.2M         25716K           820K             8K         N-           -         S             0           0%         httpd
 1460            -         root             root                7          0.07s          0.08s             0K             0K             0K             0K         --           -         S             1           0%         glusterfs

```
