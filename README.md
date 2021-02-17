# pgbackup

CLI for backing up remote PostgreSQL databases locally or to AWS S3.


## Preparing for Development

### Ensure pip and pipenv are installed
```
$ pip3 install --user pipenv
$ pipenv --python $(which python3)
```

### Clone repository and cd into repository
```
git clone git@github.com:example/pgbackup && cd pgbackup
```

### Fetch development dependencies
``make install``

### Activate virtualenv:
``pipenv shell``

Rather than creating a requirements.txt file for us, pipenv has created a Pipfile that it will use to store virtualenv and dependency information. To activate our new virtualenv, we use the command pipenv shell, and to deactivate it we use exit instead of deactivate.


## Usage

> Pass in a full database URL, the storage driver, and destination.

 * S3 Example w/ bucket name:
```
$ pgbackup postgres://bob@example.com:5432/db_one --driver s3 backups
```

 * Local Example w/ local path:
```
$ pgbackup postgres://bob@example.com:5432/db_one --driver local /var/local/db_one/backups
```

### Running Tests

Run tests locally using make if virtualenv is active:
```
$ make
```

> If virtualenv isn’t active then use:
```
$ pipenv run make
```
