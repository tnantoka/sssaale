# SSSaaLE

[![Build Status](https://travis-ci.org/tnantoka/sssaale.svg?branch=master)](https://travis-ci.org/tnantoka/sssaale)

Server-Side Swift as a Live Example

## Requirement

- Vapor Toolbox
- Docker for Mac
- Heroku CLI

## Usage

```
$ vapor new Hello --template=tnantoka/sssaale
```

## Development

### Editing

```
$ vapor xcode -y
```

### Run

```
$ docker pull swiftdocker/swift
$ docker run -it -v `pwd`:/app -w /app -p 8080:8080 swiftdocker/swift
$ swift build && .build/Debug/App
```

### Testing

```
$ swift test
```

## Deploy

```
$ vapor heroku init
$ vapor heroku push
```

## Demo

https://sssaale.herokuapp.com
