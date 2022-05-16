# lemp
nginx mysql php on alpine linux

This repo is based on [`adhocore/phpfpm:8.0`](https://github.com/adhocore/docker-phpfpm/)

## Usage

Install [docker](https://docs.docker.com/install/) in your machine.

```sh
# or with PHP8.0
docker pull agusriga/lemp

# Go to your project root then run
docker run -p 80:80 -v `pwd`:/var/www/html --name lemp -d agusriga/lemp

# In windows, you would use %cd% instead of `pwd`
docker run -p 80:80 -v %cd%:/var/www/html --name lemp -d agusriga/lemp

# If you want to setup MySQL credentials, pass env vars
docker run -p 8080:80 -p 8888:88 -v `pwd`:/var/www/html \
  -e MYSQL_ROOT_PASSWORD=1234567890 -e MYSQL_DATABASE=appdb \
  -e MYSQL_USER=dbuser -e MYSQL_PASSWORD=123456 \
  --name lemp -d agusriga/lemp
```

After running container as above, you will be able to browse [localhost:80](http://localhost)!

### Stop container

To stop the container, you would run:

```sh
docker stop lemp
```

### (Re)Start container

You dont have to always do `docker run` as in above unless you removed or lost your `lemp` container.

Instead, you can just start when needed:

```sh
docker start lemp
```

### MySQL Default credentials

- **root password**: 1234567890 (if `MYSQL_ROOT_PASSWORD` is not passed)
- **user password**: 123456 (if `MYSQL_USER` is passed but `MYSQL_PASSWORD` is not)

### Nginx

URL rewrite is already enabled for you.

Either your app has `public/` folder or not, the rewrite adapts automatically.

