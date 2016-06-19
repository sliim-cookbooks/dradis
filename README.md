dradis Cookbook
================
Installs and configures [Dradis](http://dradisframework.org) - A Collaboration and reporting framework for InfoSec teams!

[![Cookbook Version](https://img.shields.io/cookbook/v/dradis.svg)](https://community.opscode.com/cookbooks/dradis) [![Build Status](https://travis-ci.org/sliim-cookbooks/dradis.svg?branch=master)](https://travis-ci.org/sliim-cookbooks/dradis) 

Requirements
------------
#### Packages
- `ruby`
- `git`

#### Platforms
The following platforms and versions are tested and supported using Opscode's test-kitchen.
- `Debian 8`

Attributes
----------
#### dradis::default

|  Key                               |  Type   |  Description                                                                |
| ---------------------------------- | ------- | --------------------------------------------------------------------------- |
| `[dradis][git_repository]`         | String  | Dradis Git repository (default: `https://github.com/dradis/dradis-ce.git`)  |
| `[dradis][git_reference]`          | String  | Dradis Git reference to use (default: `master`)                             |
| `[dradis][install_path]`           | String  | Installation directory (default: `/opt/dradis-ce`)                          |
| `[dradis][addons]`                 | Hash    | List of Dradis addons to clone.                                             |
| `[dradis][plugins]`                | Array   | List of plugins to enable (default: `[]`)                                   |
| `[dradis][database][use_db]`       | Boolean | Use data bag instead of attributes for `database` config (default: `false`) |
| `[dradis][database][config]`       | Hash    | `database` configuration attributes (default: `{}`)                         |
| `[dradis][secrets][use_db]`        | Boolean | Use data bag instead of attributes for `secrets` config (default: `false`)  |
| `[dradis][secrets][config]`        | Hash    | `secrets` configuration attributes (default: `{}`)                          |
| `[dradis][databag][name]`          | String  | Data bag name (default: `dradis`)                                           |
| `[dradis][databag][database_item]` | String  | Data bag item for database configuration (default: `database`)              |
| `[dradis][databag][secrets_item]`  | String  | Data bag item for secrets configuration (default: `secrets`)                |

Usage
-----
Include `dradis` in your node's `run_list` to install ad configure Dradis and its requirements:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[dradis]"
  ],
  "attributes": {
    "dradis": {
      "database": {
        "config": {
          "development": {
            "adapter": "sqlite3",
            "database": "db/development.sqlite3",
            "pool": 5,
            "timeout": 5000
          },
          "test": {
            "adapter": "sqlite3",
            "database": "db/test.sqlite3",
            "pool": 5,
            "timeout": 5000
          },
          "production": {
            "adapter": "sqlite3",
            "database": "db/production.sqlite3",
            "pool": 5,
            "timeout": 5000
          }
        }
      },
      "secrets": {
        "config": {
          "development": {
            "secret_key_base": "my-dev-secret-key"
          },
          "test": {
            "secret_key_base": "my-test-secret-key"
          },
          "production": {
            "secret_key_base": "my-prod-secret-key"
          }
        }  
      }
    }
  }
}
```

Dradis can be configured from attributes or data bags. To use data bags, you need to create a data bag `dradis` with items `database`, `secrets`, these values can be configured from attributes `node[dradis][databag][name]`, `node[dradis][databag][database_item]` and `node[dradis][databag][secrets_item]`.

Once created, set attributes `node[dradis][database][use_db]` and `node[dradis][secrets][use_db]` to true on your node and you are ready to configure Dradis from data bags.

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[dradis]"
  ],
  "attributes": {
    "dradis": {
      "database": {
        "use_db": true
      },
      "secrets": {
        "use_db": true
      }
    }
  }
}
```

#### Example data bags:
- `dradis/database.json`
```
{
  "id": "database",
  "config": {
    "development": {
      "adapter": "sqlite3",
      "database": "db/development.sqlite3",
      "pool": 5,
      "timeout": 5000
    },
    "test": {
      "adapter": "sqlite3",
      "database": "db/test.sqlite3",
      "pool": 5,
      "timeout": 5000
    },
    "production": {
      "adapter": "sqlite3",
      "database": "db/production.sqlite3",
      "pool": 5,
      "timeout": 5000
    }
  }
}
```

- `dradis/secrets.json`
```
{
  "id": "secrets",
  "config": {
    "development": {
      "secret_key_base": "my-dev-secret-key"
    },
    "test": {
      "secret_key_base": "my-test-secret-key"
    },
    "production": {
      "secret_key_base": "my-prod-secret-key"
    }
  }
}
```

Tests
-----

- First, install dependencies:  
`bundle install`

- Run Checkstyles:  
`bundle exec rake`

- Run Kitchen tests:
`bundle exec rake kitchen`

Docker driver is used for integration testing with `test-kitchen`. You will need to have `docker` installed to run integration testing, or adapt the existing `.kitchen.yml` for your driver.

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Sliim <sliim@mailoo.org> 

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
