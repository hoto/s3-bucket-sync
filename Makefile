.PHONY: clean sync-from-s3-to-local check-what-would-be-uploaded danger-override-files-from-local-to-s3

clean:
	@echo -n "This will remove local files only. Continue? [y/N] " && read ans && [ $${ans:-N} = y ]
	rm -rf ./{s3_bucket_name}

sync-from-s3-to-local:
	aws s3 sync s3://{s3_bucket_name} ./{s3_bucket_name}/.

check-what-would-be-uploaded:
	aws s3 sync ./{s3_bucket_name}/. s3://{s3_bucket_name} --dryrun

danger-override-files-from-local-to-s3:
	aws s3 sync ./{s3_bucket_name}/. s3://{s3_bucket_name} --dryrun
	@echo -n "\nThis will override above listed files in S3. Are you sure? [y/N] " && read ans && [ $${ans:-N} = y ]
	@echo -n "This cannot be easily undone. Are you absolutely sure? [y/N] " && read ans && [ $${ans:-N} = y ]
	aws s3 sync ./{s3_bucket_name}/. s3://{s3_bucket_name}
