
Lineage 16.0 for Merlin
=======================

Current Status
--------------

What's working?
 - IDK

What's not working?
 - IDK

Download
--------

My current builds are available [here]().

Build Instructions (Whith Scripts)
----------------------------------

Just run

	./build.sh

or

	./build-auto.sh
	
to build lineage 16.0


Build Instructions
------------------
Create a build directory

	mkdir lineage
	cd lineage

Initialize your local repository using the LineageOS trees, use a command like this:

    repo init -u git://github.com/LineageOS/android.git -b lineage-16.0

Now create a local_manifests directory

    mkdir .repo/local_manifests

Copy my local manifest 'merlin.xml' to the 'local_manifests' directory.

Then to sync up:

    repo sync -c -f --force-sync

OR, for those with limited bandwidth/storage:

    repo sync -c -f --no-clone-bundle --no-tags --force-sync --optimized-fetch --prune

Currently I a use a few patches for development reasons and to fix a couple of compile issues. Copy patch.sh and the .patch files from this repo to the root of your build folder. Then run the patch.sh script to apply.

Now start the build...

```bash
# Go to the root of the source tree...
$
# ...and run to prepare our devices list
$ . build/envsetup.sh
# ... now run
$ brunch merlin
```

Please see the [LineageOS Wiki](https://wiki.lineageos.org/) for further information.
