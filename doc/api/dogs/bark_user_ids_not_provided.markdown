# Dogs API

## bark_user_ids not provided

### GET /dogs

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| bark_user_ids | Array of one or more BarkBox user ids | true |  |

### Request

#### Headers

<pre>Host: example.org
Cookie: </pre>

#### Route

<pre>GET /dogs</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Cache-Control: no-cache
X-Request-Id: 5030d717-9d0b-46bc-9464-aa9e45538f65
X-Runtime: 0.006099
Content-Length: 51</pre>

#### Status

<pre>400 Bad Request</pre>

#### Body

<pre>{
  "errors": [
    {
      "status": "400",
      "title": "Bad Request"
    }
  ]
}</pre>
