# Dogs API

## Get multiple dogs when authorized

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

<pre>GET /dogs?bark_user_ids[]=11&amp;bark_user_ids[]=12</pre>

#### Query Parameters

<pre>bark_user_ids: [&quot;11&quot;, &quot;12&quot;]</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;a22ecdb8f232bc3badb00872534e0091&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 1bb89317-618d-43e9-8733-866acfe0dbb0
X-Runtime: 0.010178
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
        "bark_user_id": 11,
        "birthday": "2015-01-01T05:00:00.000Z",
        "image_url": "http://www.example_image_url_11.jpg",
        "name": "Cristiano Ruffnaldo",
        "size": "M"
      }
    },
    {
      "id": "2",
      "type": "dogs",
      "attributes": {
        "bark_user_id": 12,
        "birthday": "2015-01-01T05:00:00.000Z",
        "image_url": "http://www.example_image_url_12.jpg",
        "name": "Cristiano Ruffnaldo",
        "size": "M"
      }
    }
  ],
  "links": {
    "self": "http://example.org/dogs?bark_user_ids[]=11&bark_user_ids[]=12&cursor[before]=3",
    "first": "http://example.org/dogs?bark_user_ids[]=11&bark_user_ids[]=12&cursor[before]",
    "prev": "http://example.org/dogs?bark_user_ids[]=11&bark_user_ids[]=12&cursor[after]=2",
    "next": "http://example.org/dogs?bark_user_ids[]=11&bark_user_ids[]=12&cursor[before]=1",
    "last": "http://example.org/dogs?bark_user_ids[]=11&bark_user_ids[]=12&cursor[after]"
  }
}</pre>
