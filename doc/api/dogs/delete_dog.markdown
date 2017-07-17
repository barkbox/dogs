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
ETag: W/&quot;b46d31409d89b055438e02f6bf31f26b&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 14471bcf-4720-456a-b08a-cb29e42b1a2b
X-Runtime: 0.008037
Content-Length: 177</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "id": 1,
  "user_id": 2,
  "birthday": "2015-01-01T05:00:00.000Z",
  "image_url": "http://www.example_image_url_2.jpg",
  "name": "Cristiano Ruffnaldo",
  "size": "M",
  "sex": "M",
  "breed": "Shiba Inu"
}</pre>
