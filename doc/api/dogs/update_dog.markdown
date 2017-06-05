# Dogs API

## update dog

### PATCH /dogs/:id

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| name |  name | false |  |
| size |  size | false |  |

### Request

#### Headers

<pre>Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>PATCH /dogs/1</pre>

#### Body

<pre>name=Doge+Bryant&size=L</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;8edc6afa5a20bd35215c074cd9ded6ec&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 7e98a7f4-4a1f-4cea-9a0d-cdb3ba7555e4
X-Runtime: 0.023216
Content-Length: 184</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "data": {
    "id": "1",
    "type": "dogs",
    "attributes": {
      "bark_user_id": 1,
      "birthday": "2015-01-01T05:00:00.000Z",
      "image_url": "http://www.example_image_url_1.jpg",
      "name": "Doge Bryant",
      "size": "L"
    }
  }
}</pre>
