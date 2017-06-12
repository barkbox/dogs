# Dogs API

## Get dog that does not exist 

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
X-Request-Id: a37a9118-673a-458c-bcac-e3966487da5c
X-Runtime: 0.006494
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
