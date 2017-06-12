# Dogs API

## Get multiple dogs without bark_user_ids param

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
X-Request-Id: b1803206-df2a-4dd6-999f-a917fe9a01ed
X-Runtime: 0.002390
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
