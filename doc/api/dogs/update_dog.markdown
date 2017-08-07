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

<pre>birthday=2017-08-07+21%3A18%3A33+UTC&image=www.example.com%2Fpickles.jpg&name=Doge+Bryant&size=L&sex=F&breed=Shiba+Inu</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;062792865a7cffbf6fe11501412421d2&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 14a4fd18-6ed0-4aee-9074-ba648ff8c022
X-Runtime: 0.013828
Content-Length: 248</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "id": 1,
  "user_id": 2,
  "birthday": "2017-08-07T21:18:33.000Z",
  "image_url": "https://www.example_image_url.jpg",
  "name": "Doge Bryant",
  "size": "L",
  "sex": "F",
  "breed": "Shiba Inu",
  "created_at": "2017-08-07T21:18:33.318Z",
  "updated_at": "2017-08-07T21:18:33.331Z"
}</pre>
