# Dogs API

## returns 404 when not authorized

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
X-Request-Id: fb70e062-c728-4e59-9d97-34dee8d3611a
X-Runtime: 0.009921
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
