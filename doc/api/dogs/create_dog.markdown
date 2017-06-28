# Dogs API

## Create dog

### POST /dogs

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| user_id |  user | true |  |
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

<pre>user_id=1&birthday=2017-06-22+18%3A20%3A01+UTC&image=www.example.com%2Fpickles.jpg&name=Cristiano+Ruffnaldo&size=M</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;b533717052d1c4c01f251b903327ac55&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 748a3dc3-a58b-448c-8a8c-84896faea6ae
X-Runtime: 0.013434
Content-Length: 197</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "data": {
    "id": "1",
    "type": "dogs",
    "attributes": {
      "user_id": 1,
      "birthday": "2017-06-22T18:20:01.000Z",
      "image_url": "https://www.example_image_url.jpg",
      "name": "Cristiano Ruffnaldo",
      "size": "M",
      "sex": null
    }
  }
}</pre>
