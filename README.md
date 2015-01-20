# OpenProject Remove Orphan Projects Plugin
[![Code Climate](https://codeclimate.com/github/oliverguenther/openproject-orphan_projects/badges/gpa.svg)](https://codeclimate.com/github/oliverguenther/openproject-orphan_projects)

This plugin deletes orphaned projects after their project owner has been deleted.

## Notes

* Projects are only removed if no other user is a member (of some kind) in the project

## Planned Features

* Transfer project ownership to the next highest member

## Requirements

* OpenProject Version >= 4.0

## Installation

Create a file `Gemfile.plugins` in your OpenProject installation with the following content:

	gem "openproject-orphan_projects", :git => "https://github.com/oliverguenther/openproject-orphan_projects.git"


Please see the [OpenProject plugin overview](https://www.openproject.org/projects/openproject/wiki/OpenProject_Plug-Ins)
for more details.

## License

Copyright (c) 2015 Oliver Günther (mail@oliverguenther.de)

This plugin is licensed under the MIT license. See COPYING for details.

## Funding

Initial development of this plugin is backed with funds from [Qualitätssicherung von Studium und Lehre](https://www.informatik.tu-darmstadt.de/de/fachbereich/einrichtungen/qsl-kommission/) and was supported by the [ISP Fachbereich Informatik](https://www.isp.informatik.tu-darmstadt.de/de) at the Technische Universität Darmstadt.
