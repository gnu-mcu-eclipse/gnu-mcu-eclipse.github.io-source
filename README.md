# The GNU ARM Eclipse Web Site source


## Overview

This GitHub project, available from [gnuarmeclipse/gnuarmeclipse.github.io-source](https://github.com/gnuarmeclipse/gnuarmeclipse.github.io-source), contains the source files used to generate the **GNU ARM Eclipse Web Site**.

## Destination URL

The **GNU ARM Eclipse Web Site** is an organisation [GitHub Pages](https://pages.github.com) site, stored in the [gnuarmeclipse/gnuarmeclipse.github.io](https://github.com/gnuarmeclipse/gnuarmeclipse.github.io) Git and publicly available from [http://gnuarmeclipse.github.io](http://gnuarmeclipse.github.io).


## Jekyll

The web site is generated off-line by [Jekyll](http://jekyllrb.com). It cannot be generated by [GitHub Pages](https://pages.github.com) because it uses Jekyll plug-ins, considered unsafe and disabled by the GitHub Pages instance of Jekyll.

## Prerequisites

To be able to run the Jekyll build process, the `ruby` interpreter and the `gem` tool are required. In macOS 10.10.5, these tools are preinstalled, at least when the Developer Command Line tools are present.

	$ ruby --version
	ruby 2.0.0p481 (2014-05-08 revision 45883) [universal.x86_64-darwin14]
	$ gem --version
	2.0.14
	$ sudo gem install jekyll
	...
	$ jekyll --version
	jekyll 2.5.3


In addition, the several specific gems are required:

	$ sudo gem install redcarpet jekyll-mentions jemoji jekyll-redirect-from jekyll-feed jekyll-sitemap jekyll-last-modified-at



## Clone Git

To manage the web site, a local copy of this repository is required.

	$ git clone https://github.com/gnuarmeclipse/gnuarmeclipse.github.io-source.git gnuarmeclipse.github.io-source.git

## Development

The current development cycle is edit-save-build-view.

The build can be performed automatically by Jekyll when started in server mode.

	$ cd gnuarmeclipse.github.io-source.git
	$ jekyll serve --baseurl "" --trace

To view the result, point the browser to `localhost:4000`.

## Publish

The build result is in the `_site` folder.

This folder is configured as a submodule, linked to the [gnuarmeclipse.github.io](https://github.com/gnuarmeclipse/gnuarmeclipse.github.io) project.

To publish, commit this Git and the new site will be automatically updated.

## Folder structure

### Posts

All blog posts are in the `_posts` folder, with specific pages in `qemu`, `openocd` and `windows-build-tools`.

### Pages

All web pages are in the `pages` folder, with specific pages in `qemu`, `openocd` and `windows-build-tools`.

## 'last\_modified\_at:'

To maintain sitelink.xml usefulness, while maintaining pages and posts, it is necessary to keep this variable up-to-date.

## Timezone

As per `_config.yml`, the default timezone is UTC. For other timezones, set it explicitly as offset (for example +0300)

## Contributing

Contributions are welcomed!

Please review the [Contributing Guidelines](CONTRIBUTING.md) for details.
