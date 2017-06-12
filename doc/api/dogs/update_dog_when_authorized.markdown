# Dogs API

also able to do via PUT

## Update dog when authorized

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
ETag: W/&quot;43afc63b6278cb9ce642fd418302c1e6&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 9359a025-3c20-46af-b5a1-35657bf7cf68
X-Runtime: 0.014920
Content-Length: 186</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "data": {
    "id": "1",
    "type": "dogs",
    "attributes": {
      "bark_user_id": 22,
      "birthday": "2015-01-01T05:00:00.000Z",
      "image_url": "http://www.example_image_url_22.jpg",
      "name": "Doge Bryant",
      "size": "L"
    }
  }
}</pre>
