/*
 * Copyright 2012 Mozilla Foundation
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

/*
 * This program creates a number of symlinks in Linaro's /dev tree
 * to make if more similar to AOSP. This allows us to reuse AOSP's
 * init scripts.
 */

#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>

#define DSTPATH "/dev/block/platform/omap/omap_hsmmc.0/by-name"

#define MMCBLK0(_p) \
  "/dev/block/mmcblk0p" #_p

struct slink {
  char *oldpath;
  char *newpath;
};

int
main(int argc, char *argv[])
{
  static const struct slink links[] = {
    {MMCBLK0(1), DSTPATH "/boot"},
    {MMCBLK0(2), DSTPATH "/system"},
    {MMCBLK0(3), DSTPATH "/cache"},
    {MMCBLK0(5), DSTPATH "/userdata"},
    {MMCBLK0(6), DSTPATH "/sdcard"}
  };

  int res = mkdir(DSTPATH, S_IRWXU|S_IRGRP|S_IXGRP|S_IROTH|S_IXOTH);

  if (res < 0) {
    if (errno == EEXIST) {
      /* if the DSTPATH exists we're probably on AOSP */
      goto succ;
    } else {
      perror("mkdir");
      goto err_mkdir;
    }
  }

  const struct slink *link = links;

  while (link < links+sizeof(links)/sizeof(links[0])) {

    res = symlink(link->oldpath, link->newpath);

    if (res < 0) {
      perror("symlink");
      goto err_symlink;
    }

    ++link;
  }

succ:
  exit(EXIT_SUCCESS);

  /* clean up FS if an error happened */

err_symlink:
  while (link > links) {
    --link;
    unlink(link->newpath);
  }
  rmdir(DSTPATH);
err_mkdir:
  exit(EXIT_FAILURE);
}
