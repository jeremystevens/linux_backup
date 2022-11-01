#!/bin/sh
# Copyright 2022 Jeremy Stevens <jeremiahstevens@gmail.com>
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
# _version__ = '0.0.3'  # current version
date
START_TIME=$(date +%s)
echo "############### Backing up files on the system... ###############"
backupfilename=blackbox_backup_`date '+%Y-%m-%d'`
tar cvf /mnt/test/blackbox/${backupfilename}.tar /home/*
# use highest compression level
gzip -9 /mnt/test/blackbox/${backupfilename}.tar
rm /mnt/test/blackbox/${backupfilename}.tar
# remove files older than 30 days
find /mnt/test/blackbox/ -type f -mtime +30 -exec rm {} \;
chmod 666 /mnt/test/blackbox/${backupfilename}.tar.gz
echo "############### Completed backing up system... ###############"
date
END_TIME=$(date +%s)
# convert seconds to minutes
ELAPSED_TIME=$(($END_TIME - $START_TIME))
echo "Elapsed time: $(($ELAPSED_TIME / 60)) minutes and $(($ELAPSED_TIME % 60)) seconds."
