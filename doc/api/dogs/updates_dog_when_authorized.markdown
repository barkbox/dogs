# Dogs API

## updates dog when authorized

### PATCH /dogs/:id

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| name |  name | false |  |
| size |  size | false |  |

### Request

#### Headers

<pre>Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>PATCH /dogs/1</pre>

#### Body

<pre>name=Doge+Bryant&size=L</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;abfef4a5aaab801da6c06d18e097a830&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 375e3a63-9afd-4fad-8e48-0dcbe4dbae51
X-Runtime: 0.018770
Content-Length: 186</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "data": {
    "id": "1",
    "type": "dogs",
    "attributes": {
      "bark_user_id": 24,
      "birthday": "2015-01-01T05:00:00.000Z",
      "image_url": "http://www.example_image_url_24.jpg",
      "name": "Doge Bryant",
      "size": "L"
    }
  }
}</pre>
