# Dogs API

also able to do via PUT

## Update dog

### PATCH /dogs/:id

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
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

<pre>PATCH /dogs/1</pre>

#### Body

<pre>birthday=2017-07-17+18%3A31%3A23+UTC&image=www.example.com%2Fpickles.jpg&name=Doge+Bryant&size=L&sex=F&breed=Shiba+Inu</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;add6b56360e0fd685bc9a840035f3e64&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 253e9e41-5aef-44a0-b15d-1793ed637e08
X-Runtime: 0.011284
Content-Length: 168</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "id": 1,
  "user_id": 3,
  "birthday": "2017-07-17T18:31:23.000Z",
  "image_url": "https://www.example_image_url.jpg",
  "name": "Doge Bryant",
  "size": "L",
  "sex": "F",
  "breed": "Shiba Inu"
}</pre>
