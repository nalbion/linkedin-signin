# &lt;linkedin-signin&gt;

Polymer wrapper and Material Design styling of LinkedIn's sign in button.

Based on https://github.com/gustavoisensee/linkedin-button


## License

[MIT License](http://opensource.org/licenses/MIT)

## Options

### `client-id`

Get yours from https://www.linkedin.com/secure/developer

### `on-load`

An optional comma-separated list of the names of Javascript functions that you want the
SDK to execute once it has successfully loaded itself.

### `authorize`

A boolean value that, when set to true, will instruct the SDK to check for a cookie containing
an existing authentication token for the user.  If found, the user will be automatically logged
in when the SDK is invoked.
The default value is false, which will require the user to log in every page load, regardless of
previous successful logins.

### `lang`

`en_US`, `fr_FR`, `es_ES`, `ru_RU`, `de_DE`, `it_IT`, `pt_BR`, `ro_RO`, `tr_TR`, `ja_JP`, `in_ID`, `ms_MY`, `ko_KR`, `sv_SE`, `cs_CZ`, `nl_NL`, `pl_PL`, `no_NO`, `da_DK`

### `fields`

Comma delimited list of profile fields to request
 eg: "id,num-connections,picture-url"

### `person` (read only)

### `error` (read only)

### `button-ready` (read only)
False until the Material Design styles have been applied
