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
ETag: W/&quot;6e7d876f55782551ba154965047060aa&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 032ce2bb-55f5-4b46-95d6-9a22a9797b80
X-Runtime: 0.008998
Content-Length: 257</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "id": 1,
  "user_id": 4,
  "birthday": "2015-01-01T05:00:00.000Z",
  "image_url": "http://www.example_image_url_4.jpg",
  "name": "Cristiano Ruffnaldo",
  "size": "M",
  "sex": "M",
  "breed": "Shiba Inu",
  "created_at": "2017-08-07T21:18:33.414Z",
  "updated_at": "2017-08-07T21:18:33.414Z"
}</pre>
