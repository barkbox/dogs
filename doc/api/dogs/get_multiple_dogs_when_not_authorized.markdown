# Dogs API

## Get multiple dogs when not authorized

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

<pre>GET /dogs?bark_user_ids[]=13&amp;bark_user_ids[]=14</pre>

#### Query Parameters

<pre>bark_user_ids: [&quot;13&quot;, &quot;14&quot;]</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Cache-Control: no-cache
X-Request-Id: c5c4ad4c-04b0-4e9c-9f0e-5d745c4f7676
X-Runtime: 0.003472
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
