dradis Cookbook
================
Installs and configures [Dradis](http://dradisframework.org) - A Collaboration and reporting framework for InfoSec teams!

[![Cookbook Version](https://img.shields.io/cookbook/v/dradis.svg)](https://community.opscode.com/cookbooks/dradis) [![Build Status](https://travis-ci.org/sliim-cookbooks/dradis.svg?branch=master)](https://travis-ci.org/sliim-cookbooks/dradis) 

Requirements
------------
#### Packages
- `git`

#### Platforms
The following platforms and versions are tested and supported using Opscode's test-kitchen.
- `Debian 8`

Attributes
----------
#### dradis::default

|  Key                        |  Type   |  Description                                                           |
| --------------------------- | ------- | ---------------------------------------------------------------------- |
| `[dradis][][]`       | Array   |  (default: ``)             |


Usage
-----
#### dradis::default
Include `dradis` in your node's `run_list` to install dradis and its requirements:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[dradis]"
  ],
  "attributes": {
    "dradis": {
      
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
