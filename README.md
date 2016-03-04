# [Formify](https://github.com/IcaliaLabs/formify)

*Formify is a super simple solution to serialize forms and save them to local storage.*


## Table of contents
- [Quick start](#quick-start)
- [Bug tracker & feature request](#bug-tracker-&-feature-request)
- [Running formify locally](#running-formify-locally)
- [Contributing](#contributing)
- [License](#copyright-and-license)

## Quick start

Using Formify is extremely easy, you can download using one of the following options:

* [Download](dist/formify.js)
* Clone the repot: `git clone git@github.com:IcaliaLabs/formify.git`

**You will need jQuery to run the plugin**

Once you have downloaded the plugin, just drop it on your project and invoke it:

```html
 <script type="text/javascript" charset="utf-8" src="//code.jquery.com/jquery-2.2.0.min.js"></script>
 <script src="/javascripts/formify.js"></script>
```

```javascript
var form = new Formify.Form("idOfTheFormToSave")
```

## Bug tracker & feature request

Have a bug or a feature request? [Please open a new issue](https://github.com/IcaliaLabs/formify/issues). Before opening any issue, please search for existing issues.

## Running formify locally

1. You need to install [Middleman](https://middlemanapp.com/)
2. Install the dependencies using `bundle install`
3. You can lift the server with `middleman server`
4. Open <http://localhost:4567/> and you are good to go.

Middleman is a great way to work with static pages.

## Contributing

Please submit all pull requests against a separate branch.


## Copyright and license

Code and documentation copyright 2013-2016 Icalia Labs. Code released under [the MIT license](LICENSE).
