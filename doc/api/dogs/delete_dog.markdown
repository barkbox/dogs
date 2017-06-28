# Dogs API

## Delete dog

### DELETE /dogs/:id
### Request

#### Headers

<pre>Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /dogs/1</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;d26973bf470d761d33bf707455303f91&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 5690de45-9b51-4d57-aa4e-058afa4955bf
X-Runtime: 0.006034
Content-Length: 197</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "data": {
    "id": "1",
    "type": "dogs",
    "attributes": {
      "user_id": 4,
      "birthday": "2015-01-01T05:00:00.000Z",
      "image_url": "http://www.example_image_url_4.jpg",
      "name": "Cristiano Ruffnaldo",
      "size": "M",
      "sex": "M"
    }
  }
}</pre>
