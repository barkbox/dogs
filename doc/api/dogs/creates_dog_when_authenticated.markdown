# Dogs API

## creates dog when authenticated

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

<pre>bark_user_id=3&birthday=2015-01-01+05%3A00%3A00+UTC&image=http%3A%2F%2Fwww.example_image_url_3.jpg&name=Cristiano+Ruffnaldo&size=M</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;e26945afedda1ae8cfa565997faad460&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 059aec0d-fb01-4b89-acfb-6c67d85611f0
X-Runtime: 0.018848
Content-Length: 191</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "data": {
    "id": "3",
    "type": "dogs",
    "attributes": {
      "bark_user_id": 3,
      "birthday": "2015-01-01T05:00:00.000Z",
      "image_url": "https://www.example_image_url.jpg",
      "name": "Cristiano Ruffnaldo",
      "size": "M"
    }
  }
}</pre>
