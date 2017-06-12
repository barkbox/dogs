# Dogs API

## list specific dog when authorized

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
ETag: W/&quot;dbd3e9fb261a99da0379601c822f9358&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a0ad133e-678a-48a7-a3ef-963ffb997b3c
X-Runtime: 0.003822
Content-Length: 194</pre>

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
      "name": "Cristiano Ruffnaldo",
      "size": "M"
    }
  }
}</pre>
