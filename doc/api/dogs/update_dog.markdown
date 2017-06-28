# Dogs API

also able to do via PUT

## Update dog

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
ETag: W/&quot;f48531f7d8e8937a464a7e443e70e4ad&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 97155ddd-a56d-4dae-99d9-b949adcaedb1
X-Runtime: 0.008019
Content-Length: 189</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "data": {
    "id": "1",
    "type": "dogs",
    "attributes": {
      "user_id": 3,
      "birthday": "2015-01-01T05:00:00.000Z",
      "image_url": "http://www.example_image_url_3.jpg",
      "name": "Doge Bryant",
      "size": "L",
      "sex": "M"
    }
  }
}</pre>
