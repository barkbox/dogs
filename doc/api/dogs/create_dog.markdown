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
| sex |  sex | false |  |
| breed |  breed | false |  |

### Request

#### Headers

<pre>Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>POST /dogs</pre>

#### Body

<pre>user_id=1&birthday=2017-07-17+18%3A31%3A23+UTC&image=www.example.com%2Fpickles.jpg&name=Cristiano+Ruffnaldo&size=M&sex=M&breed=Shiba+Inu</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;833d0a8dcbff6d4c3298ca8302002ea0&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 37c1c530-2169-4294-91d7-aa9e5f00942f
X-Runtime: 0.007637
Content-Length: 176</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "id": 1,
  "user_id": 1,
  "birthday": "2017-07-17T18:31:23.000Z",
  "image_url": "https://www.example_image_url.jpg",
  "name": "Cristiano Ruffnaldo",
  "size": "M",
  "sex": "M",
  "breed": "Shiba Inu"
}</pre>
