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

<pre>user_id=1&birthday=2017-08-07+21%3A18%3A33+UTC&image=www.example.com%2Fpickles.jpg&name=Cristiano+Ruffnaldo&size=M&sex=M&breed=Shiba+Inu</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;d3d06eb3d7b3b6ac013074c817556cf5&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 57303228-002d-45e6-bbd2-5e525b6de406
X-Runtime: 0.026764
Content-Length: 256</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "id": 1,
  "user_id": 1,
  "birthday": "2017-08-07T21:18:33.000Z",
  "image_url": "https://www.example_image_url.jpg",
  "name": "Cristiano Ruffnaldo",
  "size": "M",
  "sex": "M",
  "breed": "Shiba Inu",
  "created_at": "2017-08-07T21:18:33.385Z",
  "updated_at": "2017-08-07T21:18:33.385Z"
}</pre>
