# Dogs API

## Get dog by id

### GET /dogs/:id
### Request

#### Headers

<pre>Host: example.org
Cookie: </pre>

#### Route

<pre>GET /dogs/1</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;c5f9aae918a03c64962607b594391136&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 3b68ca51-c9bf-4b41-938f-7845de91cf28
X-Runtime: 0.022199
Content-Length: 197</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "data": {
    "id": "1",
    "type": "dogs",
    "attributes": {
      "user_id": 1,
      "birthday": "2015-01-01T05:00:00.000Z",
      "image_url": "http://www.example_image_url_1.jpg",
      "name": "Cristiano Ruffnaldo",
      "size": "M",
      "sex": "M"
    }
  }
}</pre>
