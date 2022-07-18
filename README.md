# S3 Bucket Sync

Sync a whole S3 bucket to and from local machine.

### How to

Override `{s3_bucket_name}` with the bucket name in `Makefile` first.

Clean the local download directory, this is safe:

    make clean

Sync files from S3 to local directory, this is safe:

    make sync-from-s3-to-local

### Check what files would get uploaded

Check what files would be overridden when uploading from local dir into S3, this is safe:

    make check-what-would-be-uploaded

The output will show you what files would get uploaded to S3 as the diff between local and S3 changed:

    $ make check-what-would-be-uploaded

### Danger, upload and override

Danger: Upload only changed files overriding them in S3, this cannot be undone:

    make danger-override-files-from-local-to-s3

