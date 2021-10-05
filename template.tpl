// Copyright 2019 Google LLC

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at

//     https://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

___INFO___

{
  "displayName": "Example Template",
  "description": "This is an example template. For more information, visit https://developers.google.com/tag-manager/templates",
  "categories": ["AFFILIATE_MARKETING", "ADVERTISING"],
  "securityGroups": [],
  "id": "cvt_temp_public_id",
  "type": "TAG",
  "version": 1,
  "brand": {
    "thumbnail": "",
    "displayName": "",
    "id": "brand_dummy"
  },
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "help": "Enter an example measurement ID. The value can be any character. This is only an example.",
    "displayName": "Example Measurement ID",
    "defaultValue": "foobarbaz1234",
    "name": "MeasurementID",
    "type": "TEXT"
  }
]


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "get_referrer",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urlParts",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "isRequired": true
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// Enter your template code here.
const sendPixel = require('sendPixel');
const encodeUri = require('encodeUri');
const encodeUriComponent = require('encodeUriComponent');

let url = encodeUri(data['url']);

if (data['useCacheBuster']) {
  const encode = require('encodeUriComponent');
  const cacheBusterQueryParam = data['cacheBusterQueryParam'] || 'gtmcb';
  const last = url.charAt(url.length - 1);
  let delimiter = '&';
  if (url.indexOf('?') < 0) {
    delimiter = '?';
  } else if (last == '?' || last == '&') {
    delimiter = '';
  }
  url += delimiter +
      encodeUriComponent(cacheBusterQueryParam) + '=' + encodeUriComponent(data['randomNumber']);
}
sendPixel(url, data['gtmOnSuccess'], data['gtmOnFailure']);
___NOTES___

Created on 9/2/2019, 1:02:37 PM
