# Dogs API

## Get dog when not authorized

### GET /dogs/:id
### Request

#### Headers

<pre>Host: example.org
Cookie: </pre>

#### Route

<pre>GET /dogs/%3Aid</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Cache-Control: no-cache
X-Request-Id: 3c8d72a3-ba4b-4052-bca6-9a937a4f98bd
X-Runtime: 0.010731
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
