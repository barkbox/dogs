# Dogs API

## Create dog when authenticated

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

<pre>bark_user_id=26&birthday=2015-01-01+05%3A00%3A00+UTC&image=http%3A%2F%2Fwww.example_image_url_26.jpg&name=Cristiano+Ruffnaldo&size=M</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;0c7d7626307fb94c3dc8706f84edd1c3&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 503a2919-8eee-43ee-97e1-8db95a6e4ee7
X-Runtime: 0.006454
Content-Length: 192</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "data": {
    "id": "3",
    "type": "dogs",
    "attributes": {
      "bark_user_id": 26,
      "birthday": "2015-01-01T05:00:00.000Z",
      "image_url": "https://www.example_image_url.jpg",
      "name": "Cristiano Ruffnaldo",
      "size": "M"
    }
  }
}</pre>
