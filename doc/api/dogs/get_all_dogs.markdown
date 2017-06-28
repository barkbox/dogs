# Dogs API

Will return all dogs for a user if a user_id parameter is supplied. Otherwise, it will return all dog records

## Get all dogs

### GET /dogs

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| user_id | User id | false |  |

### Request

#### Headers

<pre>Host: example.org
Cookie: </pre>

#### Route

<pre>GET /dogs?user_id=2</pre>

#### Query Parameters

<pre>user_id: 2</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;a1b725c81bf430f1d3835f296747b496&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 655df708-b3aa-4fa2-af1d-f8b27afb3a2f
X-Runtime: 0.005176
Content-Length: 529</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "data": [
    {
      "id": "1",
      "type": "dogs",
      "attributes": {
        "user_id": 2,
        "birthday": "2015-01-01T05:00:00.000Z",
        "image_url": "http://www.example_image_url_2.jpg",
        "name": "Cristiano Ruffnaldo",
        "size": "M",
        "sex": "M"
      }
    }
  ],
  "links": {
    "self": "http://example.org/dogs?user_id=2&cursor[before]=2",
    "first": "http://example.org/dogs?user_id=2&cursor[before]",
    "prev": "http://example.org/dogs?user_id=2&cursor[after]=1",
    "next": "http://example.org/dogs?user_id=2&cursor[before]=1",
    "last": "http://example.org/dogs?user_id=2&cursor[after]"
  }
}</pre>
