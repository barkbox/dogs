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
ETag: W/&quot;391353ff7cd4bb3f0744a492a231eda8&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: f2de8f49-bf3a-49e0-a69d-d37313ea4ed8
X-Runtime: 0.004049
Content-Length: 257</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "id": 1,
  "user_id": 3,
  "birthday": "2015-01-01T05:00:00.000Z",
  "image_url": "http://www.example_image_url_3.jpg",
  "name": "Cristiano Ruffnaldo",
  "size": "M",
  "sex": "M",
  "breed": "Shiba Inu",
  "created_at": "2017-08-07T21:18:33.349Z",
  "updated_at": "2017-08-07T21:18:33.349Z"
}</pre>
