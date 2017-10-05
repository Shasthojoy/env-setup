# env-setup
[![](https://img.shields.io/badge/License-MIT-blue.svg?style=flat-square)](https://yuu.github.io/license/mit.md)



## Table of Contents
  * [Usage](#usage)
  * [Requirements](#requirements)
  * [Installation](#installation)

## Usage

### docker proxy conf

```
$ ./bin local -y docker.yml cookbook/docker/defautl.rb
```

## Requirements
  - [mitamae](https://github.com/itamae-kitchen/mitamae)


## Installation
- [See latst version](https://github.com/k0kubun/mitamae/releases/latest)

```
VERSION=v1.5.1
OS=$(uname)
URL=https://github.com/itamae-kitchen/mitamae/releases/download/${VERSION}/mitamae-x86_64-${OS}

wget $URL -O bin
```
