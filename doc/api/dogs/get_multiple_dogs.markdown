# Dogs API

## Get multiple dogs

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

<pre>GET /dogs?bark_user_ids[]=15&amp;bark_user_ids[]=16</pre>

#### Query Parameters

<pre>bark_user_ids: [&quot;15&quot;, &quot;16&quot;]</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;9d526c24709b0ee4f1973e714b8cef03&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 4a3cb2f5-947a-46d9-880d-f11e0134b681
X-Runtime: 0.006022
Content-Length: 877</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "data": [
    {
      "id": "1",
      "type": "dogs",
      "attributes": {
        "bark_user_id": 15,
        "birthday": "2015-01-01T05:00:00.000Z",
        "image_url": "http://www.example_image_url_15.jpg",
        "name": "Cristiano Ruffnaldo",
        "size": "M"
      }
    },
    {
      "id": "2",
      "type": "dogs",
      "attributes": {
        "bark_user_id": 16,
        "birthday": "2015-01-01T05:00:00.000Z",
        "image_url": "http://www.example_image_url_16.jpg",
        "name": "Cristiano Ruffnaldo",
        "size": "M"
      }
    }
  ],
  "links": {
    "self": "http://example.org/dogs?bark_user_ids[]=15&bark_user_ids[]=16&cursor[before]=3",
    "first": "http://example.org/dogs?bark_user_ids[]=15&bark_user_ids[]=16&cursor[before]",
    "prev": "http://example.org/dogs?bark_user_ids[]=15&bark_user_ids[]=16&cursor[after]=2",
    "next": "http://example.org/dogs?bark_user_ids[]=15&bark_user_ids[]=16&cursor[before]=1",
    "last": "http://example.org/dogs?bark_user_ids[]=15&bark_user_ids[]=16&cursor[after]"
  }
}</pre>
