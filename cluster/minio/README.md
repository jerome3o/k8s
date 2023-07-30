# MinIO

S3 Compatible storage.

## Install [mc](https://min.io/docs/minio/linux/reference/minio-mc.html)

Install mc tool for testing

```sh
curl https://dl.min.io/client/mc/release/linux-amd64/mc -o mc
chmod +x mc
mv mc ~/.local/bin/
```

## Testing

Make an access key via the console UI, add an alias for the instance, and list all items

```sh
mc alias set dev http://minio-dev.k8s.jeromeswannack.com/ $ACCESS_KEY $SECRET_KEY
mc ls dev -r
```
