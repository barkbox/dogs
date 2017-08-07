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

<pre>GET /dogs?user_id=1</pre>

#### Query Parameters

<pre>user_id: 1</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;efb2c490359cc024ea7f5b749fb590fe&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 1332468d-096b-4efc-ba61-596d56fc1c5f
X-Runtime: 0.025254
Content-Length: 259</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>[
  {
    "id": 1,
    "user_id": 1,
    "birthday": "2015-01-01T05:00:00.000Z",
    "image_url": "http://www.example_image_url_1.jpg",
    "name": "Cristiano Ruffnaldo",
    "size": "M",
    "sex": "M",
    "breed": "Shiba Inu",
    "created_at": "2017-08-07T21:18:33.266Z",
    "updated_at": "2017-08-07T21:18:33.266Z"
  }
]</pre>
