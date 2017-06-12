# Dogs API

## Get dog

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
ETag: W/&quot;aa8e43e6f7dc7ac983c63fa69a9bc9eb&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 9b4b0146-0c04-42a0-8930-b3269ba6f515
X-Runtime: 0.016710
Content-Length: 192</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "data": {
    "id": "1",
    "type": "dogs",
    "attributes": {
      "bark_user_id": 7,
      "birthday": "2015-01-01T05:00:00.000Z",
      "image_url": "http://www.example_image_url_7.jpg",
      "name": "Cristiano Ruffnaldo",
      "size": "M"
    }
  }
}</pre>
