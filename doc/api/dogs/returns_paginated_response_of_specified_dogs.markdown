# Dogs API

## returns paginated response of specified dogs

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

<pre>GET /dogs?bark_user_ids[]=7&amp;bark_user_ids[]=8</pre>

#### Query Parameters

<pre>bark_user_ids: [&quot;7&quot;, &quot;8&quot;]</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;458aacefdb0b04e40a0f4d8b2788fbdb&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: dd112523-d0ea-496f-8c76-979935f526f1
X-Runtime: 0.007285
Content-Length: 863</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "data": [
    {
      "id": "1",
      "type": "dogs",
      "attributes": {
        "bark_user_id": 7,
        "birthday": "2015-01-01T05:00:00.000Z",
        "image_url": "http://www.example_image_url_7.jpg",
        "name": "Cristiano Ruffnaldo",
        "size": "M"
      }
    },
    {
      "id": "2",
      "type": "dogs",
      "attributes": {
        "bark_user_id": 8,
        "birthday": "2015-01-01T05:00:00.000Z",
        "image_url": "http://www.example_image_url_8.jpg",
        "name": "Cristiano Ruffnaldo",
        "size": "M"
      }
    }
  ],
  "links": {
    "self": "http://example.org/dogs?bark_user_ids[]=7&bark_user_ids[]=8&cursor[before]=3",
    "first": "http://example.org/dogs?bark_user_ids[]=7&bark_user_ids[]=8&cursor[before]",
    "prev": "http://example.org/dogs?bark_user_ids[]=7&bark_user_ids[]=8&cursor[after]=2",
    "next": "http://example.org/dogs?bark_user_ids[]=7&bark_user_ids[]=8&cursor[before]=1",
    "last": "http://example.org/dogs?bark_user_ids[]=7&bark_user_ids[]=8&cursor[after]"
  }
}</pre>
