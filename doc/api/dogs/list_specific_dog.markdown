# Dogs API

## list specific dog

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
ETag: W/&quot;31a462890354f4886c9ceb6856564c0a&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 3909b7b4-8da2-4261-b2de-9419bad2d4ab
X-Runtime: 0.003176
Content-Length: 192</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "data": {
    "id": "1",
    "type": "dogs",
    "attributes": {
      "bark_user_id": 5,
      "birthday": "2015-01-01T05:00:00.000Z",
      "image_url": "http://www.example_image_url_5.jpg",
      "name": "Cristiano Ruffnaldo",
      "size": "M"
    }
  }
}</pre>
