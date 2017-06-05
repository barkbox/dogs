# Dogs API

## attempting to list dog that does not exist

### GET /dogs/:id
### Request

#### Headers

<pre>Host: example.org
Cookie: </pre>

#### Route

<pre>GET /dogs/123456</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Cache-Control: no-cache
X-Request-Id: 2b062c59-6ef1-41ee-b683-23cb56b1fa50
X-Runtime: 0.004701
Content-Length: 49</pre>

#### Status

<pre>404 Not Found</pre>

#### Body

<pre>{
  "errors": [
    {
      "status": "404",
      "title": "Not found"
    }
  ]
}</pre>
