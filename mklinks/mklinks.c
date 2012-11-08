/*
 * Copyright 2012 Mozilla Foundation
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * This module is a derived work from the original contribution of
 * the /device/samsung/tuna/audio/audio_hw.c by Simon Wilson
 *
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
