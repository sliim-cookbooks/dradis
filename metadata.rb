# -*- coding: utf-8 -*-

name 'dradis'
maintainer 'Sliim'
maintainer_email 'sliim@mailoo.org'
license 'Apache 2.0'
description 'Installs/Configures Dradis CE'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.0'

recipe 'dradis::default', 'Installs/Configures Dradis'

supports 'debian', '> 7.0'

source_url 'https://github.com/sliim-cookbooks/dradis' if
  respond_to?(:source_url)
issues_url 'https://github.com/sliim-cookbooks/dradis/issues' if
  respond_to?(:issues_url)
