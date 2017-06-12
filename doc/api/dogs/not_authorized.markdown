# Dogs API

## not authorized

### GET /dogs

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| bark_user_ids | Array of one or more BarkBox user ids | true |  |
| bark_user_ids | Array of one or more BarkBox user ids | true |  |
| bark_user_ids | Array of one or more BarkBox user ids | true |  |

### Request

#### Headers

<pre>Host: example.org
Cookie: </pre>

#### Route

<pre>GET /dogs?bark_user_ids[]=12&amp;bark_user_ids[]=13</pre>

#### Query Parameters

<pre>bark_user_ids: [&quot;12&quot;, &quot;13&quot;]</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Cache-Control: no-cache
X-Request-Id: ed0b5c47-4856-4027-ab79-399765768ce6
X-Runtime: 0.005921
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
