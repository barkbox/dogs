# Dogs API

## does not create dog when not authenticated

### POST /dogs

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| bark_user_id |  bark user | true |  |
| birthday | Any object that can be stored as DateTime | false |  |
| image | Can be image file, IO object, or url | false |  |
| name |  name | false |  |
| size |  size | false |  |

### Request

#### Headers

<pre>Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>POST /dogs</pre>

#### Body

<pre>bark_user_id=1&birthday=2015-01-01+05%3A00%3A00+UTC&image=http%3A%2F%2Fwww.example_image_url_1.jpg&name=Cristiano+Ruffnaldo&size=M</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Cache-Control: no-cache
X-Request-Id: afa1c69b-1a6c-4119-bb33-c69efa8c0a2b
X-Runtime: 0.012101
Content-Length: 61</pre>

#### Status

<pre>422 Unprocessable Entity</pre>

#### Body

<pre>{
  "errors": [
    {
      "status": "422",
      "title": "unauthenticated error"
    }
  ]
}</pre>
