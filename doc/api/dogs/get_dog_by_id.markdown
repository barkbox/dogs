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
ETag: W/&quot;6c79cb27de708d9801e00f0371b1e27b&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a8eaee23-5d54-4008-9ba0-b9996f7195c8
X-Runtime: 0.004424
Content-Length: 177</pre>

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
  "breed": "Shiba Inu"
}</pre>
